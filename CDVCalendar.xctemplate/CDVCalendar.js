/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */
//
//  CDVCalendar
//  CDVCalendar Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan
//

(function() {
 
 var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks
 
 function CDVCalendar(){}
 
 
 
 //init
 CDVCalendar.prototype.init = function(success, fail, resultType) {
 cordovaRef.exec(success, fail, "CDVCalendar", "init", [resultType]);
 }
 
 //createEvent
 CDVCalendar.prototype.createEvent = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.createEvent failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.createEvent failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback, errorCallback, "CDVCalendar", "createEvent", [title,location,notes,startDate,endDate]);
 }
 
 //createEventWithAlert
 CDVCalendar.prototype.createEventWithAlert = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.createEventWithAlert failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.createEventWithAlert failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback, errorCallback, "CDVCalendar", "createEventWithAlert", [title,location,notes,startDate,endDate]);
 }
 
 
 //modifyEvent
 CDVCalendar.prototype.modifyEvent = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.modifyEvent failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.modifyEvent failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"CDVCalendar","modifyEvent", [title,location,notes,startDate,endDate]);
 }
 
 //deleteEvent
 CDVCalendar.prototype.deleteEvent = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.deleteEvent failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.deleteEvent failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"CDVCalendar","deleteEvent", [title,location,notes,startDate,endDate]);
 }
 
 //findEvent
 CDVCalendar.prototype.findEventByArray = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.findEventByArray failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.findEventByArray failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"CDVCalendar","findEventByArray", [title,location,notes,startDate,endDate]);
 }
 
 
 //init
 CDVCalendar.prototype.findEventByID = function(success, fail, resultType) {
 cordovaRef.exec(success, fail, "CDVCalendar", "findEventByID", [resultType]);
 }
 
 
 //findEvent
 CDVCalendar.prototype.deleteByID = function(successCallback, errorCallback, id) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.deleteByID failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.deleteByID failure: successCallback parameter must be a function");
 return
 }
 if (id != null){
 cordovaRef.exec(successCallback,errorCallback,"CDVCalendar","deleteByID", [id]);
 }else{console.log('id = null!');}
 }
 
 
 //install
 CDVCalendar.install = function(){
 
 if ( !window.plugins ) {
 window.plugins = {};
 }
 if ( !window.plugins.CDVCalendar ) {
 window.plugins.CDVCalendar = new CDVCalendar();
 }
 
 }
 
 if (cordovaRef && cordovaRef.addConstructor) {
 cordovaRef.addConstructor(CDVCalendar.install);
 } else {
 console.log("CDVCalendar Cordova Plugin could not be installed.");
 return null;
 }
 
 
 })();
