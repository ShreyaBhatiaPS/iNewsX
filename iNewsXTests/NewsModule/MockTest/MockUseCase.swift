//
//  MockUseCase.swift
//  iNewsXTests
//
//  Created by Shreya Bhatia on 07/07/22.
//

import Foundation

class MockUseCase: INewsUseCase {
    
    var news: News?
    var error: BaseErrorClass?
    
    func getTheNews(callback: @escaping NewsCompletionHandler) {
       
    }
    
    
    
    
    
}
