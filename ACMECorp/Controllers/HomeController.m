//
//  HomeController.m
//  ACMECorp
//
//  Created by Sarath Ambati on 6/14/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import "HomeController.h"
#import "ProductCell.h"
#import "Products.h"
#import "SWRevealViewController.h"

@interface HomeController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSArray* products;
@end

@implementation HomeController

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
    self.title = @"Trending Products";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return @"Home Theater";
    else
        return @"Mobile";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.00f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productsCellID" forIndexPath:indexPath];
    
    return cell;
}
@end
