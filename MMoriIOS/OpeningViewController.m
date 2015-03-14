//
//  OpeningViewController.m
//  MMoriIOS
//
//  Created by Jason Hoffman on 3/13/15.
//  Copyright (c) 2015 JHM. All rights reserved.
//

#import "OpeningViewController.h"

@interface OpeningViewController () <UITextFieldDelegate, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *yearsAliveField;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSString *yearsAlive;

@end

@implementation OpeningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.birthdayField.delegate = self;
    self.yearsAliveField.delegate = self;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIToolbar *doneBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(textFieldDidEndEditing:)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *barItems = @[space, space, doneButton];
    doneBar.items = barItems;
    
    if ([self.yearsAliveField isFirstResponder]) {
        
        textField.inputAccessoryView = doneBar;
        [textField setKeyboardType:UIKeyboardTypeNumberPad];
        
    }
    
    if ([self.birthdayField isFirstResponder]) {
        
        UIDatePicker *datePicker = [[UIDatePicker alloc] init];
        [datePicker setDatePickerMode:UIDatePickerModeDate];
        
        textField.inputView = datePicker;
        textField.inputAccessoryView = doneBar;
        
        [datePicker addTarget:self action:@selector(datePickerChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
}

- (void)datePickerChanged:(UIDatePicker *)datePicker
{
    NSLog(@"%@", datePicker.date);
    self.date = datePicker.date;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.yearsAliveField isFirstResponder]) {
        NSLog(@"Done");
        [self.yearsAliveField endEditing:YES];
    }
    
    if ([self.birthdayField isFirstResponder]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM/dd/yyyy"];
        
        self.birthdayField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:self.date]];
        [self.birthdayField endEditing:YES];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController *resultsViewController = [segue destinationViewController];
    
}


@end
