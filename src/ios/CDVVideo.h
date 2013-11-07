//
//  CDVVideo.h
//  
//
//  Updated by Tom Krones 2013-09-30.
//  Created by Peter Robinett on 2012-10-15.
//
//

#import <Cordova/CDV.h>
#import "MovieViewController.h"

@interface CDVVideo : CDVPlugin {
  MovieViewController *player;
  NSArray *movies;
  int movies_idx;
}

- (void) play:(CDVInvokedUrlCommand*)command;

@end
