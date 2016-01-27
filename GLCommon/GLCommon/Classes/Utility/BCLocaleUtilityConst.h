//
//  BCLocaleUtilityConstatns.h
//  FourSeasonPlace
//
//  Created by Ji Will on 11/6/12.
//  Copyright (c) 2012 iBrand. All rights reserved.
//

#ifndef FourSeasonPlace_UULocaleUtilityConstatns_h
#define FourSeasonPlace_UULocaleUtilityConstatns_h

// method
#define D_Method_LocalizedString(x) [[BCLocaleUtility sharedInstance] localizedStringKey:(x) Comment:nil]
#define D_Method_BOOLString(x) ((x) ? @"YES" : @"NO")

////////////////////////////////////////////////////////////////////////////////////
// AppKeys
#define D_AppKey_AppLanguage @"AppLanguage"


// Language Types
#define D_Language_AppleLanguages @"AppleLanguages"
#define D_Language_en @"en"
#define D_Language_zh_Hans @"zh-Hans"
#define D_Language_zh_cn @"zh-cn"
#define D_Language_zh_tw @"zh-tw"

// Language Keys
#define D_Language_English                              @"English"
#define D_Language_Chinese                              @"Chinese"
#define D_Language_Chinese_Taiwan                       @"Chinese-Taiwan"

#define D_Language_Unknown                              @"Unknown"
#define D_Language_Switching_Language_ellipsis          @"Switching Language ..."

#define D_Language_News                                 @"News"
#define D_Language_Products                             @"Products"
#define D_Language_Favorite                             @"Favorite"
#define D_Language_More                                 @"More"
#define D_Language_Chart                                @"Chart"
#define D_Language_Follow                               @"Follow"
#define D_Language_Me                                   @"Me"
#define D_Language_LineUp                               @"Line Up"
#define D_Language_Cancel_LineUp                        @"Cancel Line Up"
#define D_Language_Vote                                 @"Vote"
#define D_Language_Interactive                          @"Interactive"
#define D_Language_MembershipService                    @"MembershipService"
#define D_Language_Membership                           @"Membership"
#define D_Language_Food                                 @"Food"
#define D_Language_Villa                                @"Villa"
#define D_Language_Restaurant                           @"Restaurant"
#define D_Language_Services                             @"Services"

#define D_Language_LatestDynamic                        @"LatestDynamic"
#define D_Language_SeriesProduct                        @"SeriesProduct"
#define D_Language_Promotions                           @"Promotions"
#define D_Language_New                                  @"New"
#define D_Language_Activities                           @"Activities"
#define D_Language_RecommendVilla                       @"RecommendVilla"
#define D_Language_NewsAndActivities                    @"NewsAndActivities"
#define D_Language_Residence                            @"Residence"
#define D_Language_VillaLife                            @"VillaLife"
#define D_Language_Cookbook                             @"Cookbook"
#define D_Language_Takeaways                            @"Takeaways"
#define D_Language_TakeawaysCart                        @"Takeaways Cart"
#define D_Language_Rest_Order                           @"Rest. Order"
#define D_Language_Order                                @"Order"
#define D_Language_Book                                 @"Book"
#define D_Language_Book_Table                           @"Book Table"
#define D_Language_Favorites                            @"Favorites"
#define D_Language_Garden                               @"Garden"
#define D_Language_Menu                                 @"Menu"
#define D_Language_My_Garden                            @"My Garden"
#define D_Language_My_Cookbook                          @"My Cookbook"
#define D_Language_Line                                 @"Line"
#define D_Language_View                                 @"View"
#define D_Language_Luxury_Butler                        @"Luxury Butler"
#define D_Language_Car_Interiors                        @"Car Interiors"
#define D_Language_Famous_Zone                          @"Famous Zone"
#define D_Language_Watch_List                           @"Watch List"


#define D_Language_Settings                             @"Settings"
#define D_Language_Introduction                         @"Introduction"
#define D_Language_Company_Introduction                 @"Company Introduction"
#define D_Language_Find_Path                            @"Find Path"
#define D_Language_Language                             @"Language"
#define D_Language_About                                @"About"
#define D_Language_AboutUs                              @"About Us"
#define D_Language_TechnicalSupport                     @"Technical Support"
#define D_Language_VersionNumber                        @"Version Number"
#define D_Language_Search                               @"Search"
#define D_Language_Scan                                 @"Scan"
#define D_Language_Membership                           @"Membership"

#define D_Language_Personal_Settings                    @"Personal Settings"
#define D_Language_Personal_Information                 @"Personal Information"

#define D_Language_App_Settings                         @"App Settings"
#define D_Language_Notification                         @"Notification"
#define D_Language_Clear_List_Cache_On_Next_Startup     @"Clear List Cache On Next Startup"
#define D_Language_Clear_Image_Cache_On_Next_Startup    @"Clear Image Cache On Next Startup"

#define D_Language_Software_Recommendation              @"Software Recommendation"
#define D_Language_Recommendation                       @"Recommendation"

#define D_Language_CurrencyPrefix                       @"$"

#define D_Language_Sharing                              @"Sharing"
#define D_Language_I_Found                              @"I Found"
#define D_Language_To_Share_with_You                    @"To Share with You"
#define D_Language_Forward                              @"Forward"
#define D_Language_SMS                                  @"SMS"
#define D_Language_EMail                                @"EMail"
#define D_Language_SMS_Not_Supported                    @"SMS Not Supported"
#define D_Language_Sina_Weibo                           @"Sina Weibo"
#define D_Language_QQ_Weibo                             @"QQ Weibo"
#define D_Language_Dianping                             @"Dianping"
#define D_Language_Do_You_Like                          @"Do you like"

#define D_Language_Add_To_Favorite                      @"Add To Favorite"
#define D_Language_Add_To_Favorite_Successfully         @"Add To Favorite Successfully"
#define D_Language_Add_To_Favorite_Failed               @"Add To Favorite  Failed"
#define D_Language_Remove_From_Favorite                 @"Remove From Favorite"
#define D_Language_Remove_From_Favorite_Successfully    @"Remove From Favorite Successfully"
#define D_Language_Remove_From_Favorite_Failed          @"Remove From Favorite Failed"


#define D_Language_Add_To_Chart                         @"Add To Chart"
#define D_Language_Add_To_Chart_Successfully            @"Add To Chart Successfully"
#define D_Language_Add_To_Chart_Failed                  @"Add To Chart  Failed"
#define D_Language_Remove_From_Chart                    @"Remove From Chart"
#define D_Language_Remove_From_Chart_Successfully       @"Remove From Chart Successfully"
#define D_Language_Remove_From_Chart_Failed             @"Remove From Chart Failed"
#define D_Language_Total_Prices                         @"Total Prices"
#define D_Language_New_Order                            @"New Order"

#define D_Language_Alert                                @"Alert"
#define D_Language_Confirm                              @"Confirm"
#define D_Language_OK                                   @"OK"
#define D_Language_Edit                                 @"Edit"
#define D_Language_Cancel                               @"Cancel"
#define D_Language_Select                               @"Select"
#define D_Language_Box_Is_Empty_Please_Add_In_Products  @"The Box is Empty, Please Add In Products..."

#define D_Language_Photos_Show                          @"Photos Show"
#define D_Language_Stores_List                          @"Stores List"
#define D_Language_Stores                               @"Stores"
#define D_Language_StoreInfo                            @"StoreInfo"


#define D_Language_Contact_Us                           @"Contact Us"
#define D_Language_Unable_To_Dial                       @"Unable To Dial"
#define D_Language_Unable_To_Dial_Number                @"Unable To Dial Number"
#define D_Language_Unable_To_Dial_Number_Colon          @"Unable To Dial Number :"
#define D_Language_Unable_To_Access                     @"Unable To Access"
#define D_Language_Unable_To_Access_Link                @"Unable To Access Link"
#define D_Language_Unable_To_Access_Link_Colon          @"Unable To Access Link :"
#define D_Language_Device_Not_Supported_Period          @"Device Not Supported."

#define D_Language_More_ellipsis                        @"More ..."
#define D_Language_Updating_ellipsis                    @"Updating..."
#define D_Language_Loading_ellipsis                     @"Loading..."
#define D_Language_No_data_found_period                 @"No data found."
#define D_Language_Sorry_there_was_an_error_period      @"Sorry, there was an error."
#define D_Language_Sorry_network_not_reachable_period   @"Sorry, network not reachable."
#define D_Language_Last_updated_Colon                   @"Last updated:"
#define D_Language_never                                @"never"
#define D_Language_Release_to_update_ellipsis           @"Release to update..."
#define D_Language_Pull_down_to_update_ellipsis         @"Pull down to update..."
#define D_Language_The_table_view_has_never_been_updated                @"The table view has never been updated"
#define D_Language_The_last_time_the_table_view_was_updated             @"The last time the table view was updated."
#define D_Language_Release_the_table_view_to_update_the_contents_period @"Release the table view to update the contents."
#define D_Language_Drag_the_table_view_down_to_update_the_contents_period   @"Drag the table view down to update the contents."
#define D_Language_Updating_the_contents_of_a_table_view_period         @"Updating the contents of a table view."


#define D_Language_FullName                             @"Full Name"
#define D_Language_Gender                               @"Gender"
#define D_Language_Men                                  @"Men"
#define D_Language_Women                                @"Women"
#define D_Language_CellPhone                            @"Cellphone"
#define D_Language_CellPhone_Number                     @"Cellphone Number"
#define D_Language_MembershipPoints                     @"Membership Points"
#define D_Language_Points                               @"Points"
#define D_Language_Register                             @"Register"
#define D_Language_Submit                               @"Submit"
#define D_Language_Please_Input_Correct_Full_Name       @"Please Input Correct Full Name"
#define D_Language_Please_Input_Correct_Phone_Number    @"Please Input Correct Phone Number"
#define D_Language_No_Of_People                         @"No. Of People"
#define D_Language_Date_Time                            @"Date & Time"
#define D_Language_Message                              @"Message"
#define D_Language_Dishes                               @"Dishes"
#define D_Language_Address                              @"Address"
#define D_Language_Number                               @"Number"
#define D_Language_Price                                @"Price"
#define D_Language_Username                             @"Username"
#define D_Language_Password                             @"Password"
#define D_Language_Feedback                             @"Feedback"
#define D_Language_Feedbacks                            @"Feedbacks"
#define D_Language_Submit_Feedbacks                     @"Submit Feedbacks"

// Notification
#define D_Language_Notification_Alert                   @"Notification Alert"
#define D_Language_Notification_Badge                   @"Notification Badge"
#define D_Language_Notification_Sound                   @"Notification Sound"

// Lineup
#define D_Language_AheadPerson                          @"Ahead Person"
#define D_Language_CompanyName                          @"Company Name"
#define D_Language_QueueType                            @"Queue Type"
#define D_Language_QueuePosition                        @"Queue Position"
#define D_Language_QueueTime                            @"Queue Time"
#define D_Language_DropQueue                            @"Drop Queue"


// Wedding
#define D_Language_Wedding_Photo                        @"WeddingPhoto"
#define D_Language_Wedding_Hall                         @"WeddingHall"


// Health
#define D_Language_Specaility @"Speciality"
#define D_Language_SuccessCase @"SuccessCase"
#define D_Language_Brief @"Brief"
#define D_Language_SicknessField @"SicknessField"
#define D_Language_City @"City"
#define D_Language_Hospital @"Hospital"

////////////////////////////////////////////////////////////////////////////////////

#endif
