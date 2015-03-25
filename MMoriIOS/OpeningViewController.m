//
//  OpeningViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/13/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "OpeningViewController.h"
#import "ResultsViewController.h"
#import "CountryPicker.h"

@interface OpeningViewController () <UITextFieldDelegate, CountryPickerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *yearsAliveField;
@property (strong, nonatomic) NSDate *birthday;
@property (nonatomic) NSInteger yearsAlive;
@property (strong, nonatomic) NSString *sex;
@property (weak, nonatomic) IBOutlet UITextField *countryField;
@property (strong, nonatomic) CountryPicker *countryPicker;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sexSlider;

@end

@implementation OpeningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.birthdayField.delegate = self;
    self.yearsAliveField.delegate = self;
    self.countryField.delegate = self;
    
    self.countryPicker = [[CountryPicker alloc] init];
    self.countryPicker.delegate = self;
    
    self.navigationController.navigationBarHidden = YES;
    
    UIImage *backgroundImage = [UIImage imageNamed:@"mMori"];
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImageView.image = backgroundImage;
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIToolbar *doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(textFieldDidEndEditing:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *barItems = @[space, space, doneButton];
    doneBar.items = barItems;
    
    if ([self.yearsAliveField isFirstResponder]) {
        NSLog(@"yearsAliveField");
        textField.inputAccessoryView = doneBar;
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        
    }
    
    if ([self.birthdayField isFirstResponder]) {
        NSLog(@"birthdayField");
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        [datePicker setDatePickerMode:UIDatePickerModeDate];
        
        textField.inputView = datePicker;
        textField.inputAccessoryView = doneBar;
        
        [datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    if ([self.countryField isFirstResponder]) {
        
        UIBarButtonItem *usButton = [[UIBarButtonItem alloc] initWithTitle:@"U.S.A." style:UIBarButtonItemStylePlain target:self action:@selector(selectUS)];
        UIBarButtonItem *ukButton = [[UIBarButtonItem alloc] initWithTitle:@"U.K." style:UIBarButtonItemStylePlain target:self action:@selector(selectUK)];
        
        barItems = @[usButton, space, ukButton, space, doneButton];
        doneBar.items = barItems;
        
        textField.inputView = self.countryPicker;
        textField.inputAccessoryView = doneBar;
    }
    
}

- (void)selectUS
{
    [self.countryPicker selectRow:237 inComponent:0 animated:YES];
    [self countryPicker:self.countryPicker didSelectCountryWithName:@"United States" code:@"US"];
}

- (void)selectUK
{
    [self.countryPicker selectRow:236 inComponent:0 animated:YES];
    [self countryPicker:self.countryPicker didSelectCountryWithName:@"United Kingdom" code:@"GB"];
}


- (void)countryPicker:(CountryPicker *)picker didSelectCountryWithName:(NSString *)name code:(NSString *)code
{
    NSLog(@"code %@", code);
    NSLog(@"name %@", name);
    self.countryField.text = name;
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    self.birthday = datePicker.date;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.yearsAliveField isFirstResponder]) {
        NSLog(@"Done");
        [self.yearsAliveField endEditing:YES];
    }
    
    if ([self.birthdayField isFirstResponder]) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM/dd/yyy"];
        NSString *date = [formatter stringFromDate:self.birthday];
        
        self.birthdayField.text = date;
        [self.birthdayField endEditing:YES];
    }
    
    if ([self.countryField isFirstResponder]) {
        
        [self.countryField endEditing:YES];
    }
}

#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier  isEqualToString:@"GetResults"]) {
        if (![self.birthdayField hasText] || ![self.countryField hasText] || ![self.yearsAliveField hasText]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Missing info" message:@"Fill out every field to get your results" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alertView show];
            return NO;
        }
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ResultsViewController *rvc = segue.destinationViewController;
    rvc.birthday = self.birthday;
    rvc.country = self.countryField.text;
        
    if (self.sexSlider.selectedSegmentIndex == 0) {
        rvc.sex = @"female";
    } else {
        rvc.sex = @"male";
    }
}


@end
