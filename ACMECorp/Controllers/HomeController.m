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
@property (nonatomic, strong) NSArray<Product*>* tvProducts;
@property (nonatomic, strong) NSArray<Product*>* mobileProducts;
@property (nonatomic, strong) NSArray<Product*>* homeTheaterProducts;

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
    switch (section) {
            case 0:
                return @"Shop TVs";
            case 1:
                return @"Shop Home Theater";
            case 2:
                return @"Shop Mobiles";
            default:
                return @"";
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80.00f;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString* title = nil;
    switch (section) {
        case 0:
            title = @"Shop TVs";
            break;
        case 1:
            title = @"Shop Home Theater";
            break;
        case 2:
            title =  @"Shop Mobiles";
            break;
        default:
            title = @"";
    }
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UIView* headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 30.0)];
    headerView.backgroundColor = [UIColor blueColor];
    //headerView.contentMode = UIViewContentModeScaleToFill;
    
    // Add the label
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, -5.0, 300.0, 90.0)];
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.text = title;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.highlightedTextColor = [UIColor blackColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:17];
    headerLabel.numberOfLines = 0;
    [headerView addSubview: headerLabel];
    
    // Return the headerView
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
            case 0:
                return 300.00f;
            case 1:
                return 300.00f;
            case 2:
                return 300.00f;
            default:
                return 300.00f;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 2)
        return 2;
    else
        return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductCell *cell = [tableView dequeueReusableCellWithIdentifier:@"productsCellID" forIndexPath:indexPath];
    Product* product = [Product new];
    if(indexPath.section == 0)
        product = [[Products getTVs] objectAtIndex:indexPath.row];
    if(indexPath.section == 1)
        product = [[Products getHomeTheaters] objectAtIndex:indexPath.row];
    if(indexPath.section == 2)
        product = [[Products getMobiles] objectAtIndex:indexPath.row];
    
    cell.image.image = [UIImage imageNamed:product.imageName];
    cell.name.text = product.title;
    cell.price.text = product.price;
    return cell;
}
@end
