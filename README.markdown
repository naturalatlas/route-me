Route-Me
--------

Requires iOS 5 or greater (includes iOS 7+ support at runtime), Xcode 5.0 or greater, and ARC.

[![](https://raw.github.com/naturalatlas/route-me/packaging/screenshot.png)]()

Major differences from [Alpstein fork of Route-Me](https://github.com/Alpstein/route-me): 

 * Requires iOS 5.0 and above. 
 * Supports Automatic Reference Counting (ARC). 
 * [Mapbox](http://mapbox.com) & [MBTiles](http://mbtiles.org) tile source integration code. 
 * [Mapbox Markers](http://mapbox.com/blog/markers/) support. 
 * [UTFGrid interactivity](http://mapbox.com/mbtiles-spec/utfgrid/). 
 * Improved network tile loading performance. 
 * A bulk, background map tile downloader for cache pre-population and offline use. 
 * Annotation callouts that behave like MapKit. 
 * Annotation convenience subclasses for points and shapes. 
 * [CocoaPods](http://cocoapods.org) support. 
 * Removal of two-finger double-tap gesture for zoom out (to speed up two-finger single-tap recognition like MapKit). 
 * Different default starting location for maps. 
 * Built-in attribution view controller with button on map views & default OpenStreetMap attribution. 
 * Easy static map view support. 
 * Removal of included example projects in favor of separate examples on GitHub. 
 * A few added defaults for convenience. 
 * Improved documentation. 


Route-Me
--------

Route-Me is an open source map library that runs natively on iOS.  It's designed to look and feel much like the built-in iOS map library, but it's entirely open, and works with any map source using a pluggable backend system. 

Supported map tile sources include [Mapbox](http://mapbox.com/developers/api/)/[TileStream](https://github.com/mapbox/tilestream), the offline-capable, database-backed format [MBTiles](http://mbtiles.org), [OpenStreetMap](http://www.openstreetmap.org), and several others. 

Installation
------------

There are two ways that you can install the SDK, depending upon your needs: 

 1. Clone from GitHub and integrate as a dependent Xcode project. 
 1. Install via [CocoaPods](http://cocoapods.org). 

Then, update the submodules:

      git submodule update --init

There are two subdirectories - MapView and Proj4. Proj4 is a support library used to do map projections. The MapView project contains only the Route-Me map library. 

See License.txt for license details. In any app that uses this SDK, include the following text on your "preferences" or "about" screen: "Uses Route-Me (c) 2008-2015 Natural Atlas, Mapbox, Route-Me Contributors".

Dependent Libraries
-------------------

The Route-Me SDK makes use of several sub-libraries, listed below. See License.txt for more detailed information about Route-Me and Proj4 and see the individual license files in the sub-libraries for more information on each. 

 * [FMDB](https://github.com/ccgus/fmdb) by Gus Mueller (SQLite for caching and MBTiles)
 * [GRMustache](https://github.com/groue/GRMustache) by Gwendal Roué (Mustache templates)
 * [SMCalloutView](https://github.com/nfarina/calloutview) by Nick Farina (annotation callouts)
