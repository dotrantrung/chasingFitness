
//
//  AVPlayerClass.m
//  chasingFITness
//
//  Created by Trung Do on 1/20/16.
//  Copyright © 2016 Patera. All rights reserved.
//

#import "AVPlayerClass.h"

@implementation AVPlayerClass
+ (Class) layerClass{
    return [AVPlayerClass class];
}
- (AVPlayer *) player{
    return [(AVPlayerClass*) [self layer] player];
}
- (void) setMovieToPlayer: (AVPlayer*) player{
    [(AVPlayerClass*) [self layer] setPlayer:player];
}
@end
