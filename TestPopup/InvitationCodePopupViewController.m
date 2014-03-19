//
//  ViewController.m
//  TestPopup
//
//  Created by 王 飞 on 3/19/14.
//  Copyright (c) 2014 王 飞. All rights reserved.
//

#import "InvitationCodePopupViewController.h"

@interface InvitationCodePopupViewController ()

@property (weak, nonatomic) IBOutlet UIView *popupView;
@property (weak, nonatomic) IBOutlet UIButton *regenerateButton;

@end

@implementation InvitationCodePopupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.popupView.layer.borderWidth = 2.0;
    self.popupView.layer.borderColor = [UIColor blackColor].CGColor;    
    self.regenerateButton.layer.cornerRadius = 5.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismissPopup:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - kAnimationShiftForiPad, self.view.frame.size.width, self.view.frame.size.height);
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
    }];
}

@end
