//
//  RMTileMillSource.m
//
// Copyright (c) 2008-2012, Route-Me Contributors
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// * Redistributions of source code must retain the above copyright notice, this
//   list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

#import "RMTileMillSource.h"

@implementation RMTileMillSource

- (id)initWithMapName:(NSString *)mapName tileCacheKey:(NSString *)tileCacheKey minZoom:(float)minZoom maxZoom:(float)maxZoom
{
    return [self initWithHost:@"localhost" mapName:mapName tileCacheKey:tileCacheKey minZoom:minZoom maxZoom:maxZoom];
}

- (id)initWithHost:(NSString *)host mapName:(NSString *)mapName tileCacheKey:(NSString *)tileCacheKey minZoom:(float)minZoom maxZoom:(float)maxZoom
{
    return [super initWithPrefix:[NSString stringWithFormat:@"%@:20008/tile/%@", host, mapName]
                          suffix:@".png"
                    tileCacheKey:tileCacheKey
                         minZoom:minZoom
                         maxZoom:maxZoom
                       shortName:@"Generic TileMill Source"
                shortAttribution:nil
                 longDescription:nil
                 longAttribution:nil
                 supportedScales:@[@"1x"]];
}

- (NSURL *)URLForTile:(RMTile)tile
{
    NSURL *tileURL = [super URLForTile:tile];

    return [NSURL URLWithString:[[tileURL absoluteString] stringByAppendingFormat:@"?updated=%i", (int)[[NSDate date] timeIntervalSince1970]]];
}

@end
