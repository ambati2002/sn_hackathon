//
//  Products.h
//  ACMECorp
//
//  Created by Sarath Ambati on 6/14/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject
+(NSArray*)getTVs;
+(NSArray*)getHomeTheaters;
+(NSArray*)getMobiles;
@end


@interface Product : NSObject
@property (nonatomic,strong) NSString* imageName;
@property (nonatomic,strong) NSString* title;
@property (nonatomic,strong) NSString* price;
-(id) initWithImage:(NSString*)imageName withTitle:(NSString*)title withPrice:(NSString*)price;

@end
