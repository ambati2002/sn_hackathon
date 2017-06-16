//
//  Products.m
//  ACMECorp
//
//  Created by Sarath Ambati on 6/14/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import "Products.h"
@implementation Product

-(id) initWithImage:(NSString*)imageName withTitle:(NSString*)title withPrice:(NSString*)price
{
    self = [super init];
    if(self)
    {
        self.imageName = imageName;
        self.title = title;
        self.price = price;
    }
    return self;
}

@end


@implementation Products
+(NSArray*)getTVs
{
    NSMutableArray* array = [NSMutableArray new];
    [array addObject:[[Product alloc] initWithImage:@"TV-0.jpeg" withTitle:@"QLED TV" withPrice:@"$3590"]];
    [array addObject:[[Product alloc] initWithImage:@"TV-1.jpeg" withTitle:@"UHD TV" withPrice:@"$5090"]];
    [array addObject:[[Product alloc] initWithImage:@"TV-2.jpeg" withTitle:@"Curved HD TV" withPrice:@"$4290"]];
    
    return array;
    
}

+(NSArray*)getHomeTheaters
{
    NSMutableArray* array = [NSMutableArray new];
    [array addObject:[[Product alloc] initWithImage:@"Home-0.jpeg" withTitle:@"J4100 Home Theater" withPrice:@"$329"]];
    [array addObject:[[Product alloc] initWithImage:@"Home-1.jpeg" withTitle:@"J5500W Home Theater" withPrice:@"$456"]];
    [array addObject:[[Product alloc] initWithImage:@"Home-2.jpeg" withTitle:@"J5500 Sound Tower" withPrice:@"$350"]];
    
    return array;
}

+(NSArray*)getMobiles
{
    NSMutableArray* array = [NSMutableArray new];
    [array addObject:[[Product alloc] initWithImage:@"Phone-0.jpeg" withTitle:@"Galaxy Note" withPrice:@"$850"]];
    [array addObject:[[Product alloc] initWithImage:@"Phone-1.jpeg" withTitle:@"Galaxy Note2" withPrice:@"$624"]];
    
    return array;
}
@end


                     
