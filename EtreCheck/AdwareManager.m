/***********************************************************************
 ** Etresoft
 ** John Daniel
 ** Copyright (c) 2012-2014. All rights reserved.
 **********************************************************************/

#import "AdwareManager.h"
#import "Model.h"
#import "NSMutableAttributedString+Etresoft.h"
#import "Utilities.h"

@interface PopoverManager ()

// Show detail.
- (void) showDetail: (NSString *) title
  content: (NSAttributedString *) content;

@end

@implementation AdwareManager

@synthesize downloadButton = myDownloadButton;

// Constructor.
- (id) init
  {
  self = [super init];
  
  if(self)
    {
    myMinPopoverSize = NSMakeSize(400, 200);
    }
  
  return self;
  }

// Show detail.
- (void) showDetail: (NSString *) name
  {
  if([[Model model] hasMalwareBytes])
    self.downloadButton.title = NSLocalizedString(@"runmbam", NULL);
  else
    self.downloadButton.title = NSLocalizedString(@"downloadmbam", NULL);

  NSMutableAttributedString * details = [NSMutableAttributedString new];
  
  [details appendString: NSLocalizedString(@"adware", NULL)];

  [super
    showDetail: NSLocalizedString(@"About adware", NULL)
    content: details];
    
  [details release];
  }

// Go to Adware Medic.
- (IBAction) gotoAdwareMedic: (id) sender
  {
  if([[Model model] hasMalwareBytes])
    {
    NSURL * url =
      [[NSWorkspace sharedWorkspace]
        URLForApplicationWithBundleIdentifier:
          @"com.malwarebytes.antimalware"];
      
    [[NSWorkspace sharedWorkspace] openURL: url];
    
    return;
    }
  
  [[NSWorkspace sharedWorkspace]
    openURL:
      [NSURL
        URLWithString: @"http://www.malwarebytes.org/antimalware/mac/"]];
  }

@end
