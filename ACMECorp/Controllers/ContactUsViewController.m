//
//  ContactUsViewController.m
//  ACMECorp
//
//  Created by Sarath Ambati on 6/15/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import "ContactUsViewController.h"
#import "SWRevealViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self setup];
}

-(void) setup
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.tapGestureRecognizer];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        
    }
    self.title = @"Contact Us";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
