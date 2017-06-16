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

@property(nonatomic, strong) QBUUser *currentUser;
@property(nonatomic, strong) QBRTCCameraCapture *cameraCapture;
@property (strong, nonatomic) QBRTCVideoFormat *videoFormat;
@property (weak, nonatomic) AVCaptureVideoPreviewLayer *videoLayer;

@end

const NSTimeInterval kQBAnswerTimeInterval = 60.f;
const NSTimeInterval kQBDialingTimeInterval = 5.f;

@implementation ContactUsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self setup];
    [self setupQuickblox];
    [self.indicatorView stopAnimating];
    [self.waitingLabel setHidden:true];
}

- (void) viewDidDisappear:(BOOL)animated{
    if(self.cameraCapture !=nil) {
        [self.cameraCapture stopSession:nil];
    }
}

-(void) setupQuickblox {
    //    [QBSettings setAccountKey:@"xkaxeo5AewCtfuM7Jfzy"];
    //    [QBSettings setApplicationID:59030];
    //    [QBSettings setAuthKey:@"B8VqUKSEQRO2MeY"];
    //    [QBSettings setAuthSecret:@"ePE9Tv6fhdg7LRF"];
    
    [QBSettings setAccountKey:@"u13Cwu-5x5uXyssX1uvR"];
    [QBSettings setApplicationID:59094];
    [QBSettings setAuthKey:@"cL2V7twh5UdGNbQ"];
    [QBSettings setAuthSecret:@"Ox-vWAvDLVbUfda"];
    
    [QBSettings setLogLevel:QBLogLevelDebug];
    [QBSettings enableXMPPLogging];
    
    [QBRTCConfig setAnswerTimeInterval:kQBAnswerTimeInterval];
    [QBRTCConfig setDialingTimeInterval:kQBDialingTimeInterval];
    [QBRTCConfig setStatsReportTimeInterval:1.f];
    
    
    [QBRTCClient initializeRTC];
    
    [[QBRTCClient instance] addDelegate:self];
    
    //    self.currentUser = [QBUUser user];
    //    self.currentUser.ID = 28786243; // your current user's ID
    //    self.currentUser.password = @"snow2004"; // your current user's password
    //
    
    self.currentUser = [QBUUser user];
    self.currentUser.ID = 28783689; // your current user's ID
    self.currentUser.password = @"CSMRocks"; // your current user's password
    
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

-(IBAction) contactUs:(id) sender {
    /*UIAlertController* alert = [UIAlertController
     alertControllerWithTitle:@"Alert"
     message:@"Clicked"
     preferredStyle:UIAlertControllerStyleAlert];
     
     UIAlertAction* defaultAction = [UIAlertAction
     actionWithTitle:@"OK" style:UIAlertActionStyleDefault
     handler:^(UIAlertAction * action) {}];
     
     [alert addAction:defaultAction];
     [self presentViewController:alert animated:YES completion:nil];*/
    
    
    [self.indicatorView startAnimating];
    [self.indicatorView setHidden:false];
    [self.waitingLabel setHidden:false];
    [self.contactUsButton setHidden:true];
    [self.statusLabel setText:@"Connecting..."];
    
    [[QBChat instance] connectWithUser:self.currentUser completion:^(NSError * _Nullable error) {
        NSLog(@"Error: %@", error);
        [[QBChat instance] addDelegate:self];
        [self.indicatorView stopAnimating];
        [self.indicatorView setHidden:true];
        [self.waitingLabel setText:@"Support in progress. Any actions by the agent will be reflected here"];
        [self.statusLabel setText:@"Connected !!"];
    }];
    
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark -
#pragma mark QBRTCClientDelegate

- (void)didReceiveNewSession:(QBRTCSession *)session userInfo:(NSDictionary *)userInfo {
    
    if (self.session) {
        // we already have a video/audio call session, so we reject another one
        // userInfo - the custom user information dictionary for the call from caller. May be nil.
        NSDictionary *userInfo = @{ @"key" : @"value" };
        [session rejectCall:userInfo];
        return;
    }
    self.session = session;
    
    
    self.videoFormat = [QBRTCVideoFormat defaultFormat];
    self.cameraCapture = [[QBRTCCameraCapture alloc] initWithVideoFormat:self.videoFormat
                                                                position:AVCaptureDevicePositionBack];
    
    self.session.localMediaStream.videoTrack.videoCapture = self.cameraCapture;
    
    self.videoLayer = self.cameraCapture.previewLayer;
    
    self.videoLayer.frame = self.localVideoView.bounds;
    self.videoLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    
    self.localVideoView.backgroundColor = [UIColor clearColor];
    [self.localVideoView.layer addSublayer:self.videoLayer];
    
    [self.cameraCapture startSession:nil];
    
    __weak __typeof(self)weakSelf = self;
    weakSelf.session.localMediaStream.videoTrack.enabled ^=1;
    weakSelf.localVideoView.hidden = !weakSelf.session.localMediaStream.videoTrack.enabled;
    
    //Accept call
    NSDictionary *answerUserInfo = @{@"acceptCall" : @"userInfo"};
    [self.session acceptCall:answerUserInfo];
    
    
}

- (void)chatDidReceiveMessage:(QBChatMessage *)message {
    if(message.text!=nil) {
        if([message.text isEqualToString:@"camera"]) {
            __weak __typeof(self)weakSelf = self;
            weakSelf.session.localMediaStream.videoTrack.enabled ^=1;
            weakSelf.localVideoView.hidden = !weakSelf.session.localMediaStream.videoTrack.enabled;
        }
        else if([message.text isEqualToString:@"help"]) {
            NSDictionary *params = message.customParameters;
            if(params !=nil) {
                NSString * url = [params valueForKey:@"url"];
                if(url!=nil)
                    NSLog(@"URL received: %@",url);
            }
        }
        NSLog(@"Message received %@", message.text);
    }
}

@end
