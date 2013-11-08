//
//  W3WVideoLauncher.m
//  
//
//  Updated by Tom Krones 2013-09-30.
//  Created by Peter Robinett on 2012-10-15.
//
//

#import "W3WVideoLauncher.h"
#import "MediaPlayer/MPMoviePlayerViewController.h"
#import "MediaPlayer/MPMoviePlayerController.h"
#import "MovieViewController.h"
#import <Cordova/CDV.h>

@implementation W3WVideoLauncher
- (void) launch:(CDVInvokedUrlCommand*)command
{
  movies_idx = 0;
  movies = [[command.arguments objectAtIndex:0] componentsSeparatedByString:@" "];
  if ([movies count] == 0)
    return;
  NSString *movie = [movies objectAtIndex:0];
  NSString *orient = @"YES";
  NSRange range = [movie rangeOfString:@"http"];
  if(range.length > 0) {
    if ([@"YES" isEqualToString:orient]) {
      player = [[MovieViewController alloc] initWithContentURL:[NSURL URLWithString:movie] andOrientation:YES];
    } else {
      player = [[MovieViewController alloc] initWithContentURL:[NSURL URLWithString:movie] andOrientation:NO];
    }
    
  } else {
    //NSArray *fileNameArr = [movie componentsSeparatedByString:@"."];
    //NSString *prefix = [fileNameArr objectAtIndex:0];
    //NSString *suffix = [fileNameArr objectAtIndex:1];
    //NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:prefix ofType:suffix];
    //NSURL *fileURL = [NSURL fileURLWithPath:soundFilePath];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *soundFilePath = [paths objectAtIndex:0];
    NSURL *fileURL = [NSURL fileURLWithPath:[soundFilePath stringByAppendingPathComponent:movie]];
    if ([@"YES" isEqualToString:orient]) {
      player = [[MovieViewController alloc] initWithContentURL:fileURL andOrientation:YES];
    } else {
      player = [[MovieViewController alloc] initWithContentURL:fileURL andOrientation:NO];
    }
  }
  if (player) {
    // Remove the movie player view controller from the "playback did finish" notification observers
    [[NSNotificationCenter defaultCenter] removeObserver:player name:MPMoviePlayerPlaybackDidFinishNotification object:player.moviePlayer];  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(MovieDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:player.moviePlayer];
    player.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.viewController presentMoviePlayerViewControllerAnimated:player];
  }
}

- (void)MovieDidFinish:(NSNotification *)notification {
  // Obtain the reason why the movie playback finished
  NSNumber *finishReason = [[notification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
  MPMoviePlayerController* moviePlayer = [notification object];
  movies_idx++;
  if (movies_idx < [movies count] && [finishReason intValue] == MPMovieFinishReasonPlaybackEnded) {
    moviePlayer.movieSourceType = MPMovieSourceTypeUnknown;
    moviePlayer.contentURL = [NSURL URLWithString:[movies objectAtIndex:movies_idx]];
    [moviePlayer play];
  }
  else {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayer];
    [self.viewController dismissMoviePlayerViewControllerAnimated];
    [self writeJavascript:[NSString stringWithFormat:@"window.plugins.VideoLauncher.finished(\"%@\");", @""]];
  }
}

- (void)dealloc {
  //[player release];
  //[movie release];
  //[super dealloc];
}

@end
