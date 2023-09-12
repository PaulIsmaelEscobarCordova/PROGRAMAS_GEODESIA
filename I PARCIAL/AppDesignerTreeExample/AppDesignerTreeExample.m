%% App That Displays Data in a Hierarchy Using Tree
% This app shows how to add a tree to an App Designer app. 
% The app selects data from |patients.xls| and displays it in a hierarchy 
% using a tree. The tree contains three nodes that display 
% hospital names. Each hospital node contains nodes that display patient names. 
% When the user clicks a patient name in the tree, the *Patient Information* 
% panel displays data such as age, gender, and health status. 
% The app stores changes to the data in the table variable.  
% 
% In addition to the tree and *Patient Information* panel, the app also contains
% the following UI components:
%
% * Read-only text field &mdash; Used to display the patient&rsquo;s name 
% * Numeric edit field &mdash; Used to display and accept changes to the patient&rsquo;s age
% * Drop-down list &mdash; Used to display and accept changes to the patient&rsquo;s gender and health status
% * Check box &mdash; Used to display and accept changes to the patient&rsquo;s smoking history
%
% <<../treeapp_screenshot.png>>

% Copyright 2015 The MathWorks, Inc.