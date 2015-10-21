//
//  RMGenericMapSource.m
//
// Copyright (c) 2008-2013, Route-Me Contributors
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

#import "RMGenericMapSource.h"
@implementation RMGenericMapSource
{
    NSString *_prefix, *_suffix, *_uniqueTilecacheKey, *_shortName, *_shortAttribution, *_longDescription, *_longAttribution;
}

- (id)initWithPrefix:(NSString *)prefix
                    suffix:(NSString *)suffix
              tileCacheKey:(NSString *)tileCacheKey
                   minZoom:(float)minZoom
                   maxZoom:(float)maxZoom
                 shortName:(NSString *)shortName
          shortAttribution:(NSString *)shortAttribution
           longDescription:(NSString *)longDescription
           longAttribution:(NSString *)longAttribution
{
    if (!(self = [super init]))
        return nil;

    NSAssert(prefix != nil, @"Empty prefix parameter not allowed");
    NSAssert(suffix != nil, @"Empty suffix parameter not allowed");
    NSAssert(tileCacheKey != nil, @"Empty tileCacheKey parameter not allowed");

    _prefix = prefix;
    _suffix = suffix;
    _uniqueTilecacheKey = tileCacheKey;

    self.minZoom = minZoom;
    self.maxZoom = maxZoom;

    _shortName = shortName ? shortName : @"Generic Map Source";
    _longDescription = longDescription ? longDescription : @"Generic Map Source";
    _shortAttribution = shortAttribution ? shortAttribution : @"n/a";
    _longAttribution = longAttribution ? shortAttribution : @"n/a";

    return self;
}

- (NSURL *)URLForTile:(RMTile)tile
{
    NSAssert4(((tile.zoom >= self.minZoom) && (tile.zoom <= self.maxZoom)),
              @"%@ tried to retrieve tile with zoomLevel %d, outside source's defined range %f to %f",
              self, tile.zoom, self.minZoom, self.maxZoom);

    return [NSURL URLWithString:[NSString stringWithFormat:@"%@/%d/%d/%d%@", _prefix, tile.zoom, tile.x, tile.y, _suffix]];
}

- (NSString *)uniqueTilecacheKey
{
    return _uniqueTilecacheKey;
}

- (NSString *)shortName
{
	return _shortName;
}

- (NSString *)longDescription
{
	return _longDescription;
}

- (NSString *)shortAttribution
{
	return _shortAttribution;
}

- (NSString *)longAttribution
{
	return _longAttribution;
}

@end
