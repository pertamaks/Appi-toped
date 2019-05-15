@hedon
Feature: User allowed to buy things

  Background: User reach the home
    Given user reach home screen

  Scenario: User buy pulsa with valid number
    Given user scroll left the quick menu
    And user tap the "Pulsa" icon
    When user reach the "Pulsa" menu
    And user enter "081278739283" on mobile number
    And user open the nominal window
    And user select "1.000.000" nominal
    Then user tap the "Beli" button

  Scenario: User buy pulsa with invalid number
    Given user scroll left the quick menu
    And user tap the "Pulsa" icon
    When user reach the "Pulsa" menu
    And user enter "08652555888" on mobile number
    Then user open the nominal window
    @wip
  Scenario: User going to open St toms official store
    Given user tap the "Official Store" icon
    And user reach the "Brand Populer" menu
    And user select the 2nd "Lihat Semua" text
    Then user reach the "All Brands" menu
    Then user swipe left the top to the "Electronic"
    And user swipe down to find "ST-Toms Official"
    Then user reach the "ST-Toms Official" menu
