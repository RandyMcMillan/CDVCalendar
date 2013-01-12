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
//  CDVEmailComposer Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan
//

(function() {
 
 var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks
 
 function CDVCalendar(){}
 
 CDVCalendar.prototype.init = function(success, fail, resultType) {
 
 cordovaRef.exec(success, fail, "CDVCalendar", "init", [resultType]);
 
 }
 
 
 
 
 CDVCalendar.prototype.callNativeFunction = function(success, fail, resultType) {
 
 cordovaRef.exec(success, fail, "CDVCalendar", "nativeFunction", [resultType]);
 
 }
 
 /*
  CDVCalendar.prototype.nativePluginResultHandler = function(result) {
  
  console.log(result);
  
  }
  
  
  CDVCalendar.prototype.nativePluginErrorHandler = function(error) {
  
  console.log(error);
  
  }
  */
 
 
 CDVCalendar.prototype.createEventOLD = function(title,location,notes,startDate,endDate,successCallback, errorCallback) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.createEvent failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.createEvent failure: successCallback parameter must be a function");
 return
 }
 cordova.exec(successCallback,errorCallback,"CDVCalendar","createEventOLD", [title,location,notes,startDate,endDate,successCallback,errorCallback]);
 };
 
 
 
 
 
 CDVCalendar.prototype.createEvent = function(success, fail, resultType) {
 
 cordovaRef.exec(success, fail, "CDVCalendar", "createEvent", [resultType]);
 
 }
 
 
 
 
 
 CDVCalendar.prototype.deleteEvent = function(title,location,notes,startDate,endDate,successCallback, errorCallback) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.deleteEvent failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.deleteEvent failure: successCallback parameter must be a function");
 return
 }
 cordova.exec(successCallback,errorCallback,"CDVCalendar","deleteEvent", [title,location,notes,startDate,endDate]);
 }
 
 CDVCalendar.prototype.findEvent = function(title,location,notes,startDate,endDate,successCallback, errorCallback) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.findEvent failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.findEvent failure: successCallback parameter must be a function");
 return
 }
 cordova.exec(successCallback,errorCallback,"CDVCalendar","findEvent", [title,location,notes,startDate,endDate]);
 }
 
 CDVCalendar.prototype.modifyEvent = function(title,location,notes,startDate,endDate,successCallback, errorCallback) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.modifyEvent failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.modifyEvent failure: successCallback parameter must be a function");
 return
 }
 cordova.exec(successCallback,errorCallback,"CDVCalendar","modifyEvent", [title,location,notes,startDate,endDate]);
 }
 
 
 
 
 CDVCalendar.install = function()
 {
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


/*
 var CDVCalendar = {
 
 callNativeFunction: function (success, fail, resultType) {
 return cordova.exec(success, fail, "CDVCalendar", "nativeFunction", [resultType]);
 }
 }
 */





