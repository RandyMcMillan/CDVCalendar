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
//  CDVCalendar
//  CDVCalendar Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan


#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>
#import <EventKitUI/EventKitUI.h>
#import <EventKit/EventKit.h>

@interface CDVCalendar : CDVPlugin {}

extern NSString *const kCDVCalendarINIT;
extern NSString *const kCDVCalendarALERT;
extern NSString *const kCDVCalendarSAVED;
extern NSString *const kCDVCalendarDocWrite;

@property (nonatomic, retain) EKEventStore *eventStore;
@property (nonatomic,readwrite,retain) EKEvent *returnEvent;

- (void)initEventStoreWithCalendarCapabilities;

- (NSArray *)	findEKEventsWithTitle	:(NSString *)title
				location				:(NSString *)location
				message					:(NSString *)message
				startDate				:(NSDate *)startDate
				endDate					:(NSDate *)endDate;

- (void)init:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)createEventWithAlert:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)createEvent:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)modifyEventByArray:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)modifyEventByID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)findEventByArray:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)findEventByID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)deleteEvent:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;
- (void)deleteByID:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options;

@end
