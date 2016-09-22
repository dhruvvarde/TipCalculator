//
//  ViewController.m
//  tipCalc
//
//  Created by theonetech61 on 22/09/16.
//  Copyright © 2016 Estatic Infotech. All rights reserved.
//

#import "ViewController.h"

#define kOFFSET_FOR_KEYBOARD 80.0
#define IDIOM    UI_USER_INTERFACE_IDIOM()
#define IPAD     UIUserInterfaceIdiomPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



@interface ViewController (){
    float percentage;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
    
    if (IS_IPHONE_4_OR_LESS) {
        _top1.constant = 0;
        _viewHeight.constant = 55;
        _vertical1.constant = 0;
        _vertical2.constant = 5;
        _vertical3.constant = 5;
        _heightLbls.constant = 15;
        _vetical4.constant = 3;
        _vetical5.constant = 3;
        
    }
    
    
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"theme"];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    
//    gradient.colors = [NSArray arrayWithObjects:(id)[color CGColor], nil];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    self.view.backgroundColor = color;
    percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per1"] floatValue];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"amount"] != nil) {
        _amount.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"amount"]];
        _lblTipAmount.text = [self calculateTip];
        _lblTotalToPay.text = [self calculateTotalPay];
        _lblTotalPerPerson.text = [self calculateTotalPayPerPerson];
    }
    
    
    _view1.clipsToBounds = YES;
    _view1.layer.borderColor = [UIColor whiteColor].CGColor;
    _view1.layer.borderWidth = 1.0;
    
    _view2.clipsToBounds = YES;
    _view2.layer.borderColor = [UIColor whiteColor].CGColor;
    _view2.layer.borderWidth = 1.0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [_amount becomeFirstResponder];
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.frame = self.view.bounds;
    
//    [[NSUserDefaults standardUserDefaults] setObject:@18 forKey:@"per1"];
//    [[NSUserDefaults standardUserDefaults] setObject:@18 forKey:@"per2"];
//    [[NSUserDefaults standardUserDefaults] setObject:@18 forKey:@"per3"];
    [_segment setTitle:[NSString stringWithFormat:@"%@%%",[[NSUserDefaults standardUserDefaults] valueForKey:@"per1"]] forSegmentAtIndex:0];
    [_segment setTitle:[NSString stringWithFormat:@"%@%%",[[NSUserDefaults standardUserDefaults] valueForKey:@"per2"]] forSegmentAtIndex:1];
    [_segment setTitle:[NSString stringWithFormat:@"%@%%",[[NSUserDefaults standardUserDefaults] valueForKey:@"per3"]] forSegmentAtIndex:2];
    
    
    if (_segment.selectedSegmentIndex == 0) {
        //        [myNSNumber floatValue]
        percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per1"] floatValue];
    }
    else if (_segment.selectedSegmentIndex == 1){
        percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per2"] floatValue];
    }
    else{
        percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per3"] floatValue];
    }
    
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"theme"];
    UIColor *color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    
//    gradient.colors = [NSArray arrayWithObjects:(id)[color CGColor], nil];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    
    self.view.backgroundColor = color;
    
}

- (IBAction)valueChanged:(id)sender {
    
    if (_amount.text.length > 0 && _people.text.length > 0) {
        
        _lblTipAmount.text = [self calculateTip];
        _lblTotalToPay.text = [self calculateTotalPay];
        _lblTotalPerPerson.text = [self calculateTotalPayPerPerson];
        NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        [[NSUserDefaults standardUserDefaults] setObject:[f numberFromString:_amount.text] forKey:@"amount"];
    }
    else{
        _lblTipAmount.text = @"";
        _lblTotalToPay.text = @"";
        _lblTotalPerPerson.text = @"";
    }
    
}

- (IBAction)segmentChanged:(id)sender {
    
    if (_segment.selectedSegmentIndex == 0) {
//        [myNSNumber floatValue]
        percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per1"] floatValue];
        if (_amount.text.length > 0 && _people.text.length > 0) {
        _lblTipAmount.text = [self calculateTip];
        _lblTotalToPay.text = [self calculateTotalPay];
        _lblTotalPerPerson.text = [self calculateTotalPayPerPerson];
        }
        
    }
    else if (_segment.selectedSegmentIndex == 1){
        percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per2"] floatValue];
        if (_amount.text.length > 0 && _people.text.length > 0) {
        _lblTipAmount.text = [self calculateTip];
        _lblTotalToPay.text = [self calculateTotalPay];
        _lblTotalPerPerson.text = [self calculateTotalPayPerPerson];
        }
    }
    else{
        percentage = [[[NSUserDefaults standardUserDefaults] valueForKey:@"per3"] floatValue];
        if (_amount.text.length > 0 && _people.text.length > 0) {
        _lblTipAmount.text = [self calculateTip];
        _lblTotalToPay.text = [self calculateTotalPay];
        _lblTotalPerPerson.text = [self calculateTotalPayPerPerson];
        }
    }
}

-(NSString *)calculateTip{
    
    float tip = ([_amount.text floatValue]*(float)percentage)/100;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setLocale:[NSLocale currentLocale]];
//    NSString *numberAsString = ;
//    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    return [NSString stringWithFormat:@"Tip Amount :%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:tip]]];
}

-(NSString *)calculateTotalPay {
    
    float tip = ([_amount.text floatValue]*(float)percentage)/100;
    float total =[_amount.text floatValue] + tip ;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    //    NSString *numberAsString = ;
    //    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    return [NSString stringWithFormat:@"Total to Pay :%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:total]]];
    
}

-(NSString *)calculateTotalPayPerPerson {
    
    float tip = ([_amount.text floatValue]*(float)percentage)/100;
    float total =[_amount.text floatValue] + tip ;
    float totalPerPerson = total / [_people.text floatValue];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    [numberFormatter setMinimumFractionDigits:2];
    [numberFormatter setLocale:[NSLocale currentLocale]];
    //    NSString *numberAsString = ;
    //    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    return [NSString stringWithFormat:@"Total per Person :%@",[numberFormatter stringFromNumber:[NSNumber numberWithFloat:totalPerPerson]]];
    
}

@end
