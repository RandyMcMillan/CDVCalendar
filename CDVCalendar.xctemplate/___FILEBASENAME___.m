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

//  Based on https://github.com/felixactv8/Phonegap-Calendar-Plugin-ios
//  Author: Felix Montanez
//
//  ___FILEBASENAME___
//  ___FILEBASENAME___ Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan

#import <EventKitUI/EventKitUI.h>
#import <EventKit/EventKit.h>
#import <Cordova/CDVAvailability.h>
#import <Cordova/CDVViewController.h>
#import <Cordova/CDVDebug.h>

#import "___FILEBASENAME___.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation ___FILEBASENAME___
//REF: LINE: 133
NSString *const k___FILEBASENAME___INIT = @"console.log('k___FILEBASENAME___INIT = ___FILEBASENAME___ Cordova Plugin is initialized.')";
//REF: http://docs.phonegap.com/en/2.3.0/cordova_notification_notification.md.html#Notification
NSString *const k___FILEBASENAME___ALERT = @"navigator.notification.alert('k___FILEBASENAME___ALERT = Cordova  ___FILEBASENAME___ Plugin is working!')";
//REF: http://docs.phonegap.com/en/2.3.0/cordova_notification_notification.md.html#Notification
NSString *const k___FILEBASENAME___SAVED		= @"navigator.notification.alert('MESSAGE ___FILEBASENAME___.m LINE:41',calAlertDismissed,'Event Create & Saved','OK');";
NSString *const k___FILEBASENAME___SAVEDlog	= @"console.log('created and saved');";
//Not used yet
NSString *const k___FILEBASENAME___DocWrite = @"navigator.notification.alert('message',docWrite,'Event Saved','OK');";

@synthesize eventStore;
@synthesize returnEvent;
#pragma mark Initialization functions

- (CDVPlugin *)initWithWebView:(UIWebView *)theWebView
{
	self = (___FILEBASENAME___ *)[super initWithWebView:theWebView];

	if (self) {
		// [self setup];
		[self initEventStoreWithCalendarCapabilities];
	}

	return self;
}

- (void)initEventStoreWithCalendarCapabilities
{
	// Check for EventStore that is useful
	if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")) {
		// Need to request calendar permissions
		EKEventStore *localEventStore = [[EKEventStore alloc] init];
		[localEventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * error) {
				if (granted) {
					self.eventStore = localEventStore;
				} else {
					UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"No Event Support" message:@"There will be no support to view your calendar" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
					[av show];
					[av release];
				}
			}];
	} else {
		self.eventStore = [[EKEventStore alloc] init];
	}
}

#pragma mark Helper Functions

- (NSArray *)	findEKEventsWithTitle	:(NSString *)title
				location				:(NSString *)location
				message					:(NSString *)message
				startDate				:(NSDate *)startDate
				endDate					:(NSDate *)endDate
{
	// Build up a predicateString - this means we only query a parameter if we actually had a value in it
	NSMutableString *predicateString = [[NSMutableString alloc] init];

	[predicateString appendString:@""];

	if (title.length > 0) {
		[predicateString appendString:[NSString stringWithFormat:@"title LIKE '%@'", title]];
	}

	if (location.length > 0) {
		[predicateString appendString:[NSString stringWithFormat:@" AND location LIKE '%@'", location]];
	}

	/*
	 *   if (message.length > 0) {
	 *    [predicateString appendString:[NSString stringWithFormat:@" AND message LIKE '%@'", message]];
	 *   }
	 */

	NSPredicate *matches = [NSPredicate predicateWithFormat:predicateString];
	[predicateString release];

	NSArray *matchingEvents = [[self.eventStore eventsMatchingPredicate:[eventStore predicateForEventsWithStartDate:startDate endDate:endDate calendars:nil]] filteredArrayUsingPredicate:matches];

	return matchingEvents;
}

#pragma mark Cordova functions

- (void)init:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSLog(@">>>-----> ___FILEBASENAME___ init!");

	[self initEventStoreWithCalendarCapabilities];

	NSString *callbackId = [arguments pop];

	CDVViewController	*mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
	NSString			*jsString		= k___FILEBASENAME___INIT;

	[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];

	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
}

- (void)createEvent:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	EKEvent			*myEvent	= [EKEvent eventWithEventStore:self.eventStore];
	NSString		*callbackId = [arguments pop];
	NSString		*title		= [arguments objectAtIndex:0];
	NSString		*location	= [arguments objectAtIndex:1];
	NSString		*message	= [arguments objectAtIndex:2];
	NSString		*startDate	= [arguments objectAtIndex:3];
	NSString		*endDate	= [arguments objectAtIndex:4];
	NSDateFormatter *df			= [[[NSDateFormatter alloc] init] autorelease];

	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate	*myStartDate	= [df dateFromString:startDate];
	NSDate	*myEndDate		= [df dateFromString:endDate];

	myEvent.title		= title;
	myEvent.location	= location;
	myEvent.notes		= message;
	myEvent.startDate	= myStartDate;
	myEvent.endDate		= myEndDate;
	myEvent.calendar	= self.eventStore.defaultCalendarForNewEvents;
    //ADD EventKitUI.framework and EventKit.framework to your project
	EKAlarm *reminder = [EKAlarm alarmWithRelativeOffset:-2 * 60 * 60];

	[myEvent addAlarm:reminder];

	NSError *error = nil;
	[self.eventStore saveEvent:myEvent span:EKSpanThisEvent error:&error];

	BOOL saved = [self.eventStore	saveEvent	:myEvent span:EKSpanThisEvent
									error		:&error];

	// Check error code + return result
	if (saved) {
		CDVViewController	*mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
		NSString			*jsString		= k___FILEBASENAME___SAVEDlog;
		[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	}

	if (error) {
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
															messageAsString :error.userInfo.description];
		[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
	}

	if (!error) {
		NSLog(@"\n \n Create eventId >>>------> %@ \n \n", myEvent.eventIdentifier);
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_OK
															messageAsString :myEvent.eventIdentifier];
		[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
	}
}

- (void)createEventWithAlert:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	EKEvent			*myEvent	= [EKEvent eventWithEventStore:self.eventStore];
	NSString		*callbackId = [arguments pop];
	NSString		*title		= [arguments objectAtIndex:0];
	NSString		*location	= [arguments objectAtIndex:1];
	NSString		*message	= [arguments objectAtIndex:2];
	NSString		*startDate	= [arguments objectAtIndex:3];
	NSString		*endDate	= [arguments objectAtIndex:4];
	NSDateFormatter *df			= [[[NSDateFormatter alloc] init] autorelease];

	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate	*myStartDate	= [df dateFromString:startDate];
	NSDate	*myEndDate		= [df dateFromString:endDate];

	myEvent.title		= title;
	myEvent.location	= location;
	myEvent.notes		= message;
	myEvent.startDate	= myStartDate;
	myEvent.endDate		= myEndDate;
	myEvent.calendar	= self.eventStore.defaultCalendarForNewEvents;

	EKAlarm *reminder = [EKAlarm alarmWithRelativeOffset:-2 * 60 * 60];

	[myEvent addAlarm:reminder];

	NSError *error = nil;
	[self.eventStore saveEvent:myEvent span:EKSpanThisEvent error:&error];

	BOOL saved = [self.eventStore	saveEvent	:myEvent span:EKSpanThisEvent
									error		:&error];

	// Check error code + return result
	if (saved) {
		CDVViewController	*mvc___FILEBASENAME___ = (CDVViewController *)[super viewController];
		NSString			*jsString		= k___FILEBASENAME___SAVED;
		[mvc___FILEBASENAME___.webView stringByEvaluatingJavaScriptFromString:jsString];
	}

	if (error) {
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
															messageAsString :error.userInfo.description];
		[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
	}

	if (!error) {
		NSLog(@"\n \n Create eventId >>>------> %@ \n \n", myEvent.eventIdentifier);
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_OK
															messageAsString :myEvent.eventIdentifier];
		[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
	}
}

- (void)modifyEventByArray:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString *callbackId = [arguments pop];

	NSLog(@"callbackId = '%@'", callbackId);
	NSString *title = [arguments objectAtIndex:0];
	NSLog(@"title = '%@'", title);
	NSString *location = [arguments objectAtIndex:1];
	NSLog(@"location = '%@'", location);
	NSString *message = [arguments objectAtIndex:2];
	NSLog(@"notes = '%@'", message);
	NSString *startDate = [arguments objectAtIndex:3];
	NSLog(@"startDate = '%@'", startDate);
	NSString *endDate = [arguments objectAtIndex:4];
	NSLog(@"endDate = '%@'", endDate);
	NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];
	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate	*myStartDate	= [df dateFromString:startDate];
	NSDate	*myEndDate		= [df dateFromString:endDate];

	// Find matches
	NSArray *matchingEvents = [self findEKEventsWithTitle:title location:location message:message startDate:myStartDate endDate:myEndDate];

	if (matchingEvents.count == 0) {
		NSLog(@"\n \n >>>-----> matchingEvents.count = %i \n \n ", matchingEvents.count);
	}

	if (matchingEvents.count == 1) {
		// Presume we have to have an exact match to modify it!
		// Need to load this event from an EKEventStore so we can edit it
		EKEvent *theEvent = [self.eventStore eventWithIdentifier:((EKEvent *)[matchingEvents lastObject]).eventIdentifier];
		theEvent.title		= title;
		theEvent.location	= location;
		theEvent.notes		= message;
		theEvent.startDate	= myStartDate;
		theEvent.endDate	= myEndDate;

		// Now save the new details back to the store
		NSError *error = nil;
		[self.eventStore saveEvent:theEvent span:EKSpanThisEvent error:&error];

		// Check error code + return result
		if (error) {
			CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
																messageAsString :error.userInfo.description];
			[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
		} else {
			CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_OK
																messageAsString :theEvent.eventIdentifier];
			[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
		}
	} else {
		// Otherwise return a no result error
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_NO_RESULT
															messageAsInt	:matchingEvents.count];
		[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
	}

	if (matchingEvents.count > 1) {
		NSLog(@"\n \n >>>-----> matchingEvents.count = %i \n \n", matchingEvents.count);
	}
}

- (void)modifyEventByID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString		*callbackId = [arguments pop];
	NSString		*title		= [arguments objectAtIndex:0];
	NSString		*location	= [arguments objectAtIndex:1];
	NSString		*message	= [arguments objectAtIndex:2];
	NSString		*startDate	= [arguments objectAtIndex:3];
	NSString		*endDate	= [arguments objectAtIndex:4];
	NSString		*eventID	= [arguments objectAtIndex:5];
	NSDateFormatter *df			= [[[NSDateFormatter alloc] init] autorelease];

	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate	*myStartDate	= [df dateFromString:startDate];
	NSDate	*myEndDate		= [df dateFromString:endDate];

	EKEvent *theEvent = [self.eventStore eventWithIdentifier:eventID];
	theEvent.title		= title;
	theEvent.location	= location;
	theEvent.notes		= message;
	theEvent.startDate	= myStartDate;
	theEvent.endDate	= myEndDate;

	// Now save the new details back to the store
	NSError *error = nil;
	[self.eventStore saveEvent:theEvent span:EKSpanThisEvent error:&error];

	// Check error code + return result
	if (error) {
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
															messageAsString :error.userInfo.description];
		[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
	} else {
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_OK
															messageAsString :theEvent.eventIdentifier];
		[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
	}
}

- (void)deleteEvent:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString		*callbackId = [arguments pop];
	NSString		*title		= [arguments objectAtIndex:0];
	NSString		*location	= [arguments objectAtIndex:1];
	NSString		*message	= [arguments objectAtIndex:2];
	NSString		*startDate	= [arguments objectAtIndex:3];
	NSString		*endDate	= [arguments objectAtIndex:4];
	NSDateFormatter *df			= [[[NSDateFormatter alloc] init] autorelease];

	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate	*myStartDate	= [df dateFromString:startDate];
	NSDate	*myEndDate		= [df dateFromString:endDate];

	NSArray *matchingEvents = [self findEKEventsWithTitle:title location:location message:message startDate:myStartDate endDate:myEndDate];

	if (matchingEvents.count == 0) {
		NSLog(@">>>-----> matchingEvents.count = %i", matchingEvents.count);
	}

	if (matchingEvents.count == 1) {
		NSError *error = NULL;
		[self.eventStore removeEvent:[matchingEvents lastObject] span:EKSpanThisEvent error:&error];

		// Check for error codes and return result
		if (error) {
			CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
																messageAsString :error.userInfo.description];
			[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
		} else {
			CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
		}
	}

	if (matchingEvents.count > 1) {
		NSLog(@">>>-----> NOT! Definitive match - deleting lastObject! matchingEvents.count = %i", matchingEvents.count);

		NSError *error = NULL;
		[self.eventStore removeEvent:[matchingEvents lastObject] span:EKSpanThisEvent error:&error];

		// Check for error codes and return result
		if (error) {
			CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
																messageAsString :error.userInfo.description];
			[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
		} else {
			CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
			[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
		}
	}
}

- (void)findEventByArray:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString	*callbackId = [arguments pop];
	NSString	*title		= [arguments objectAtIndex:0];
	NSString	*location	= [arguments objectAtIndex:1];
	NSString	*message	= [arguments objectAtIndex:2];
	NSString	*startDate	= [arguments objectAtIndex:3];
	NSString	*endDate	= [arguments objectAtIndex:4];

	NSDateFormatter *df = [[[NSDateFormatter alloc] init] autorelease];

	[df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
	NSDate	*myStartDate	= [df dateFromString:startDate];
	NSDate	*myEndDate		= [df dateFromString:endDate];

	NSArray *matchingEvents = [self findEKEventsWithTitle:title location:location message:message startDate:myStartDate endDate:myEndDate];
	self.returnEvent = [matchingEvents objectAtIndex:0];

	if (matchingEvents.count > 0) {
		// Return the results we got
		CDVPluginResult *result = [CDVPluginResult	resultWithStatus:CDVCommandStatus_OK
													messageAsString :self.returnEvent.eventIdentifier
			];
		[self writeJavascript:[result toSuccessCallbackString:callbackId]];
	} else {
		CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_NO_RESULT];
		[self writeJavascript:[result toErrorCallbackString:callbackId]];
	}
}

- (void)findEventByID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString	*callbackId = [arguments pop];
	NSString	*eventID	= [arguments objectAtIndex:0];

	NSLog(@" eventID = %@", eventID);
	NSLog(@"self.eventID = %@", eventID);

	CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
}

- (void)deleteByID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options
{
	NSString	*callbackId = [arguments pop];
	NSString	*eventID	= [arguments objectAtIndex:0];

	NSLog(@" eventID = %@", eventID);
	NSLog(@"\n \ndeleteByID id = %@ \n \n", eventID);
	NSString	*deletedEventID = nil;
	EKEvent		*myEvent		= [self.eventStore eventWithIdentifier:eventID];
	deletedEventID = myEvent.eventIdentifier;
	NSError *error = NULL;
	[self.eventStore removeEvent:myEvent span:EKSpanThisEvent error:&error];

	// Check for error codes and return result
	if (error) {
		CDVPluginResult *pluginResult = [CDVPluginResult	resultWithStatus:CDVCommandStatus_ERROR
															messageAsString :error.userInfo.description];
		[self writeJavascript:[pluginResult toErrorCallbackString:callbackId]];
		eventID = NULL;
	} else {
		CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:deletedEventID];
		[self writeJavascript:[pluginResult toSuccessCallbackString:callbackId]];
		eventID			= NULL;
		deletedEventID	= NULL;
	}
}

@end
