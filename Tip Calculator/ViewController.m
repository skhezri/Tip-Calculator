//
//  ViewController.m
//  Tip Calculator
//
//  Created by Sophia Khezri on 6/26/18.
//  Copyright © 2018 Sophia Khezri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (weak, nonatomic) IBOutlet UILabel *tip;
@property (weak, nonatomic) IBOutlet UILabel *total;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"Hello");
    [self.view endEditing: YES];
    
}

- (IBAction)onEdit:(id)sender {
    
    NSArray*percentages=@[@(.10), @(.12), @(.15), @(.18), @(.20), @(.22)];

    double tipPercentage= [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    NSLog(@"%ld", (long)self.tipControl.selectedSegmentIndex);
    NSLog(@"%f", tipPercentage);

    double bill=[self.billField.text doubleValue];
    double tip= tipPercentage *bill;
    double total= bill+tip;
    self.tipLabel.text= [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text=[NSString stringWithFormat:@"$%.2f", total];
}
- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:.2 animations:^{
    self.billField.frame= CGRectMake(self.billField.frame.origin.x, self.billField.frame.origin.y +30 , self.billField.frame.size.width, self.billField.frame.size.height);
      
        
    }];
    
     [UIView animateWithDuration:.2 animations:^{
         self.tipLabel.alpha=1;
         self.tipControl.alpha=1;
         self.totalLabel.alpha=1;
         self.tip.alpha=1;
         self.total.alpha=1;
     
       }];
     }
-

(IBAction)onEditingEnd:(id)sender {
    CGRect newFrame=self.billField.frame;
    newFrame.origin.y-=30;
    [UIView animateWithDuration:.2 animations:^{
        self.billField.frame= newFrame;
        
    }];
    [UIView animateWithDuration:.2 animations:^{
        self.tipLabel.alpha=1;
        self.tipControl.alpha=1;
        self.totalLabel.alpha=1;
        self.tip.alpha=1;
        self.total.alpha=1;
      
    }];
}
   



@end



