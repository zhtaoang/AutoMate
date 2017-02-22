//
//  SystemLaunchEnvironmentsTests.swift
//  AutoMate
//
//  Created by Joanna Bednarz on 31/01/2017.
//  Copyright © 2017 PGS Software. All rights reserved.
//

import XCTest
import AutoMate

class SystemLaunchEnvironmentsTests: XCTestCase {

    // MARK: Tests
    func testKeyValueLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.pgsWithLoveLaunchEnvironment]), ["MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.pgsWithLoveLaunchEnvironment, LaunchOptionsFactory.frameworkLaunchEnvironment]),
                       ["MADE_WITH_LOVE_BY": "PGS", "FRAMEWORK": "Automate"])
    }

    func testMultipleKeyValueLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.goalsLaunchEnvironments]),
                       ["SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.goalsLaunchEnvironments, LaunchOptionsFactory.accomplishedLaunchEnvironments]),
                       ["SAVED_TIME": "of_developers_for_coffee", "MADE_SMILE": "qa_specialists", "SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS": "for_those_who_cant_wait_for_fall"])
    }

    func testEventLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnvironment]), ["AM_EVENTS_KEY": "nil:this_week"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.futureEventsLaunchEnvironment, LaunchOptionsFactory.thisWeekEventsLaunchEnvironment]),
                       ["AM_EVENTS_KEY": "Resources:next_week,nil:recurring_monthly"])
    }

    func testAnimationLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.turnOffAnimationLaunchEnvironment]), ["AM_ANIMATION_KEY": "false"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.turnOnAnimationLaunchEnvironment]), ["AM_ANIMATION_KEY": "true"])
    }

    func testReminderLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.recurringReminderLaunchEnvironment]), ["AM_REMINDERS_KEY": "Data:johnys_birthday_reminder"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.highPriorityReminderLaunchEnvironment, LaunchOptionsFactory.recurringReminderLaunchEnvironment]), ["AM_REMINDERS_KEY": "Test data:automate_release_reminders,nil:wwdc_reminders"])
    }

    func testContactLaunchEnvironment() {
        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.johnContacts]), ["AM_CONTACTS_KEY": "Data:john"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.severalContacts, LaunchOptionsFactory.johnContacts]), ["AM_CONTACTS_KEY": "Test data:michael,nil:emma"])
    }

    // swiftlint:disable function_body_length
    func testCombinedLaunchEnvironment() {

        XCTAssertEqual(build(with: []), [:])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnvironment,
                                 LaunchOptionsFactory.pgsWithLoveLaunchEnvironment]),
                       ["AM_EVENTS_KEY": "nil:this_week",
                           "MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.goalsLaunchEnvironments,
                                 LaunchOptionsFactory.pgsWithLoveLaunchEnvironment]),
                       ["SIMPLIFY": "testing_iOS_app_ui",
                           "FIX_BUGS": "for_those_who_cant_wait_for_fall",
                           "MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnvironment,
                                 LaunchOptionsFactory.goalsLaunchEnvironments,
                                 LaunchOptionsFactory.pgsWithLoveLaunchEnvironment]),
                       ["AM_EVENTS_KEY": "nil:this_week",
                           "SIMPLIFY": "testing_iOS_app_ui", "FIX_BUGS":
                               "for_those_who_cant_wait_for_fall",
                           "MADE_WITH_LOVE_BY": "PGS"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnvironment,
                                 LaunchOptionsFactory.goalsLaunchEnvironments,
                                 LaunchOptionsFactory.pgsWithLoveLaunchEnvironment,
                                 LaunchOptionsFactory.turnOffAnimationLaunchEnvironment]),
                       ["AM_EVENTS_KEY": "nil:this_week",
                           "SIMPLIFY": "testing_iOS_app_ui",
                           "FIX_BUGS": "for_those_who_cant_wait_for_fall",
                           "MADE_WITH_LOVE_BY": "PGS",
                           "AM_ANIMATION_KEY": "false"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnvironment,
                                 LaunchOptionsFactory.goalsLaunchEnvironments,
                                 LaunchOptionsFactory.pgsWithLoveLaunchEnvironment,
                                 LaunchOptionsFactory.turnOffAnimationLaunchEnvironment,
                                 LaunchOptionsFactory.highPriorityReminderLaunchEnvironment]),
                       ["AM_EVENTS_KEY": "nil:this_week",
                           "SIMPLIFY": "testing_iOS_app_ui",
                           "FIX_BUGS": "for_those_who_cant_wait_for_fall",
                           "MADE_WITH_LOVE_BY": "PGS",
                           "AM_ANIMATION_KEY": "false",
                           "AM_REMINDERS_KEY": "Test data:automate_release_reminders,nil:wwdc_reminders"])
        XCTAssertEqual(build(with: [LaunchOptionsFactory.thisWeekEventsLaunchEnvironment,
                                    LaunchOptionsFactory.goalsLaunchEnvironments,
                                    LaunchOptionsFactory.pgsWithLoveLaunchEnvironment,
                                    LaunchOptionsFactory.turnOffAnimationLaunchEnvironment,
                                    LaunchOptionsFactory.highPriorityReminderLaunchEnvironment,
                                    LaunchOptionsFactory.severalContacts]),
                       ["AM_EVENTS_KEY": "nil:this_week",
                        "SIMPLIFY": "testing_iOS_app_ui",
                        "FIX_BUGS": "for_those_who_cant_wait_for_fall",
                        "MADE_WITH_LOVE_BY": "PGS",
                        "AM_ANIMATION_KEY": "false",
                        "AM_REMINDERS_KEY": "Test data:automate_release_reminders,nil:wwdc_reminders",
                        "AM_CONTACTS_KEY": "Test data:michael,nil:emma"])
    }

    // MARK: Helpers
    func build(with input: [LaunchOption]) -> [String: String] {
        var app = ApplicationsFactory.cleanApplication
        let launcher = TestLauncher(options: input)
        app = launcher.configure(app)

        XCTAssertEqual(app.launchArguments, [])
        return app.launchEnvironment
    }
}
