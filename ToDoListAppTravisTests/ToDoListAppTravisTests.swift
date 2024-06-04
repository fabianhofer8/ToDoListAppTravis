//
//  ToDoListAppTravisTests.swift
//  ToDoListAppTravisTests
//
//  Created by Fabian Hofer on 03.06.24.
//


import XCTest
import SwiftUI
import Combine
@testable import ToDoListAppTravis

class ToDoListAppTravisTests: XCTestCase {

    var viewModel: ViewModel!
    var cancellables: Set<AnyCancellable> = []

    override func setUpWithError() throws {
        viewModel = ViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = []
    }

    func testAddTask() throws {
        // Given
        let initialTaskCount = viewModel.tasks.count
        
        // When
        viewModel.newTask = "Test Task"
        viewModel.addTask()
        
        // Then
        XCTAssertEqual(viewModel.tasks.count, initialTaskCount + 1)
        XCTAssertEqual(viewModel.tasks.last?.name, "Test Task")
    }

    func testToggleTaskCompletion() throws {
        // Given
        viewModel.newTask = "Test Task"
        viewModel.addTask()
        let taskIndex = viewModel.tasks.count - 1
        
        // When
        let initialCompletionStatus = viewModel.tasks[taskIndex].isCompleted
        viewModel.toggleTaskCompletion(at: taskIndex)
        
        // Then
        XCTAssertNotEqual(viewModel.tasks[taskIndex].isCompleted, initialCompletionStatus)
    }

    func testAddEmptyTask() throws {
        // Given
        let initialTaskCount = viewModel.tasks.count
        
        // When
        viewModel.newTask = ""
        viewModel.addTask()
        
        // Then
        XCTAssertEqual(viewModel.tasks.count, initialTaskCount)
    }
}

