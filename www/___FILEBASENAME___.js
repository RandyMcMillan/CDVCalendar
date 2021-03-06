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
//  ___FILEBASENAME___
//  ___FILEBASENAME___ Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan
//

(function() {
 
 var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks
 
 function ___FILEBASENAME___(){}
 
 
 
 //init
 ___FILEBASENAME___.prototype.init = function(success, fail, resultType) {
 cordovaRef.exec(success, fail, "___FILEBASENAME___", "init", [resultType]);
 }
 
 //createEvent
 ___FILEBASENAME___.prototype.createEvent = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.createEvent failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.createEvent failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback, errorCallback, "___FILEBASENAME___", "createEvent", [title,location,notes,startDate,endDate]);
 }
 
 //createEventWithAlert
 ___FILEBASENAME___.prototype.createEventWithAlert = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.createEventWithAlert failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.createEventWithAlert failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback, errorCallback, "___FILEBASENAME___", "createEventWithAlert", [title,location,notes,startDate,endDate]);
 }
 
 
 //modifyEventByID
 ___FILEBASENAME___.prototype.modifyEventByID = function(successCallback, errorCallback, title, location, notes, startDate, endDate,id) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.modifyEventByID failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.modifyEventByID failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"___FILEBASENAME___","modifyEventByID", [title,location,notes,startDate,endDate,id]);
 }
 
 //modifyEventByArray
 ___FILEBASENAME___.prototype.modifyEventByArray = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.modifyEventByArray failure: errorCallback parameter must be a function");
 return
 }
 
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.modifyEventByArray failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"___FILEBASENAME___","modifyEventByArray", [title,location,notes,startDate,endDate]);
 }
 
 
 //deleteEvent
 ___FILEBASENAME___.prototype.deleteEvent = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.deleteEvent failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.deleteEvent failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"___FILEBASENAME___","deleteEvent", [title,location,notes,startDate,endDate]);
 }
 
 //findEvent
 ___FILEBASENAME___.prototype.findEventByArray = function(successCallback, errorCallback, title, location, notes, startDate, endDate) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.findEventByArray failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.findEventByArray failure: successCallback parameter must be a function");
 return
 }
 cordovaRef.exec(successCallback,errorCallback,"___FILEBASENAME___","findEventByArray", [title,location,notes,startDate,endDate]);
 }
 
 
 //init
 ___FILEBASENAME___.prototype.findEventByID = function(success, fail, resultType) {
 cordovaRef.exec(success, fail, "___FILEBASENAME___", "findEventByID", [resultType]);
 }
 
 
 //findEvent
 ___FILEBASENAME___.prototype.deleteByID = function(successCallback, errorCallback, id) {
 if (typeof errorCallback != "function")  {
 console.log("calendarPlugin.deleteByID failure: errorCallback parameter must be a function");
 return
 }
 if (typeof successCallback != "function") {
 console.log("calendarPlugin.deleteByID failure: successCallback parameter must be a function");
 return
 }
 if (id != null){
 cordovaRef.exec(successCallback,errorCallback,"___FILEBASENAME___","deleteByID", [id]);
 }else{console.log('id = null!');}
 }
 
 
 //install
 ___FILEBASENAME___.install = function(){
 
 if ( !window.plugins ) {
 window.plugins = {};
 }
 if ( !window.plugins.___FILEBASENAME___ ) {
 window.plugins.___FILEBASENAME___ = new ___FILEBASENAME___();
 }
 
 }
 
 if (cordovaRef && cordovaRef.addConstructor) {
 cordovaRef.addConstructor(___FILEBASENAME___.install);
 } else {
 console.log("___FILEBASENAME___ Cordova Plugin could not be installed.");
 return null;
 }
 
 
 })();
