//
//  MenuTableViewController.m
//  ACMECorp
//
//  Created by Sarath Ambati on 6/15/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import "MenuTableViewController.h"

@interface MenuTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray<NSString*>* menuList;
@end

@implementation MenuTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuList= [NSArray arrayWithObjects:@"Trending Products", @"Orders" , @"Wish List", @"Contact US",  nil];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"MENU";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.00f;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell" forIndexPath:indexPath];
    cell.textLabel.text = self.menuList[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 1 || indexPath.row == 2) {
        [self performSegueWithIdentifier:@"Home" sender:indexPath];
    }
    else
    {
        [self performSegueWithIdentifier:@"Contact" sender:indexPath];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[self.menuList objectAtIndex:indexPath.row] capitalizedString];
}

@end
