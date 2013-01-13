/*
 *   Licensed to the Apache Software Foundation (ASF) under one
 *   or more contributor license agreements.  See the NOTICE file
 *   distributed with this work for additional information
 *   regarding copyright ownership.  The ASF licenses this file
 *   to you under the Apache License, Version 2.0 (the
 *   "License"); you may not use this file except in compliance
 *   with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing,
 *   software distributed under the License is distributed on an
 *   "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *   KIND, either express or implied.  See the License for the
 *   specific language governing permissions and limitations
 *   under the License.
 */
//
//  CDVCalendar
//  CDVCalendar Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan
//

#import "CDVCalendar_JS.h"

@implementation CDVCalendar_JS

// /Remove line breaks/returns to use as one constant string!

NSString *const kCDVCalendarINIT = @"console.log('kCDVCalendarINIT = CDVCalendar Cordova Plugin is initialized.')";

NSString *const kCDVCalendarALERT = @"navigator.notification.alert('kCDVCalendarALERT = Cordova  CDVCalendar Plugin is working!')";


/*
 
REF: http://docs.phonegap.com/en/2.3.0rc2/cordova_notification_notification.md.html#Notification 
 
 Quick Example
 
 // Android / BlackBerry WebWorks (OS 5.0 and higher) / iPhone / Tizen
 //
 function alertDismissed() {
 // do something
 }
 
 navigator.notification.alert(
 'You are the winner!',  // message
 alertDismissed,         // callback
 'Game Over',            // title
 'Done'                  // buttonName
 );
 
 );
 
 DONT PUT THE FUNCTION NAME IN QUOTES!
 */

NSString *const kCDVCalendarSAVED = @"navigator.notification.alert('message',alertDismissed,'Event Saved','Done');";

@end
