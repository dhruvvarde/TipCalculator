//
//  ViewController.h
//  tipCalc
//
//  Created by theonetech61 on 22/09/16.
//  Copyright © 2016 Estatic Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UITextField *people;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UILabel *lblTipAmount;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalToPay;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalPerPerson;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view1;

- (IBAction)valueChanged:(id)sender;

- (IBAction)segmentChanged:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *top1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *viewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vertical1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vertical2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightLbls;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vertical3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vetical4;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *vetical5;
@end

