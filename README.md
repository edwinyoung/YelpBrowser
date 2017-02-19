# Project 3 - *Yelp Browser*

**Yelp Browser** is a Yelp search app using the [Yelp API](http://www.yelp.com/developers/documentation/v2/search_api).

Time spent: **5** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] Table rows for search results should be dynamic height according to the content height.
- [X] Custom cells should have the proper Auto Layout constraints.
- [X] Search bar should be in the navigation bar (doesn't have to expand to show location like the real Yelp app does).

The following **optional** features are implemented:

- [ ] Search results page
   - [ ] Infinite scroll for restaurant results.
   - [ ] Implement map view of restaurant results.
- [ ] Implement the restaurant detail page.


## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/9dAPKik.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

AutoLayout is not properly resizing UILabels when new Business models are being loaded into the view by the controller, either when scrolling or when doing a new search. Unfortunately, this carries over when doing orientation flips as well.

In addition, I was looking to see if there was any way to modify the button text for the search bar, since the current blue text has poor contrast with the Yelp red background since they're approximately the same luminosity. However, I couldn't find anything under the UIKit documentation for programmatic UISearchBar customization (which was required since the search bar was inserted programmatically instead of placed in the storyboard).

## License

    Copyright [2017] [Ed Young]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.