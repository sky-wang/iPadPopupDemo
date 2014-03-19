//
//  InitialViewController.m
//  TestPopup
//
//  Created by 王 飞 on 3/19/14.
//  Copyright (c) 2014 王 飞. All rights reserved.
//

#import "InitialViewController.h"
#import "InvitationCodePopupViewController.h"

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface InitialViewController ()

@property (nonatomic, strong) InvitationCodePopupViewController *invitationCodePopupViewController;

@end

@implementation InitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showInvitationCodePopup:(id)sender {
    self.invitationCodePopupViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"invitation_code_popup"];
    
    // For iPad, show popup window.
    if (IS_IPAD) {
        [self.navigationController.view addSubview:self.invitationCodePopupViewController.view];
        CGFloat width = self.invitationCodePopupViewController.view.frame.size.width;
        CGFloat height = self.invitationCodePopupViewController.view.frame.size.height;
        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
        {
            // code for landscape orientation
            width = self.invitationCodePopupViewController.view.frame.size.height;
            height = self.invitationCodePopupViewController.view.frame.size.width;
        }
        self.invitationCodePopupViewController.view.frame = CGRectMake(self.invitationCodePopupViewController.view.frame.origin.x, self.invitationCodePopupViewController.view.frame.origin.y - kAnimationShiftForiPad, width, height);
        
        [UIView animateWithDuration:kAnimationDuration animations:^{
            self.invitationCodePopupViewController.view.frame = CGRectMake(self.invitationCodePopupViewController.view.frame.origin.x, self.invitationCodePopupViewController.view.frame.origin.y + kAnimationShiftForiPad, self.invitationCodePopupViewController.view.frame.size.width, self.invitationCodePopupViewController.view.frame.size.height);
        } completion:^(BOOL finished) {
        }];
    }
    // For iPhone, just push to a the new view.
    else {
        [self.navigationController pushViewController:self.invitationCodePopupViewController animated:YES];
    }
}

@end
