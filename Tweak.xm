//LaunchNotifier by Fr0st
//Inspired by iStartupSound
//This was fun to make :)
//This took a while to figure out, so
//Please do not steal this�


#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>

#define FILE_PATH @"/var/mobile/Library/AppSound/appsound.mp3"
#define STARTUP_SOUND_PATH @"/var/mobile/Library/AppSound/startupsound.mp3"

%hook SBApplicationIcon

-(void)launch { 

    NSFileManager *soundFile=[NSFileManager defaultManager];

	NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:FILE_PATH];

		if([soundFile fileExistsAtPath:FILE_PATH]) {

        AVAudioPlayer *appSound = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
       
	 [appSound play];
	 [appSound release];
[fileURL release];
[soundFile release];
	
    }
	
	%orig;
}

%hook SBUIController
- (void)finishedLaunching {
%orig;
NSURL *fileURL2 = [[NSURL alloc] initFileURLAtPath:STARTUP_SOUND_PATH];
AVAudioPlayer *startUpSound = [[AVAudioPlayer alloc]initWithContentsOfURL:fileURL2 error:nil];
[startUpSound play];
[startUpSound release];
[fileURL2 release];
}
%end