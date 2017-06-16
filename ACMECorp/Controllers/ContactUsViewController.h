//
//  ContactUsViewController.h
//  ACMECorp
//
//  Created by Sarath Ambati on 6/15/17.
//  Copyright © 2017 ServiceNow. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <Quickblox/Quickblox.h>
#import <QuickbloxWebRTC/QuickbloxWebRTC.h>


@class QBRTCSession;

@interface ContactUsViewController : UIViewController <QBRTCClientDelegate, QBChatDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (strong, nonatomic) QBRTCSession *session;

@property (weak, nonatomic) IBOutlet UIView *localVideoView;
@property (weak, nonatomic) IBOutlet UILabel *waitingLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UIButton *contactUsButton;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

-(IBAction) contactUs:(id) sender;

@end
