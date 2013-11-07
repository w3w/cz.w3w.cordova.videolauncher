//
//  W3WVideoLauncher.h
//  
//
//  Updated by Tom Krones 2013-09-30.
//  Created by Peter Robinett on 2012-10-15.
//
//

#import <Cordova/CDV.h>
#import "MovieViewController.h"

@interface W3WVideoLauncher : CDVPlugin {
  MovieViewController *player;
  NSArray *movies;
  int movies_idx;
}

- (void) launch:(CDVInvokedUrlCommand*)command;

@end
