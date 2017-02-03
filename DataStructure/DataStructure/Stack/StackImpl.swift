//
//  StackImpl.swift
//  DataStructure
//
//  Created by Tarun Sharma on 2/3/17.
//  Copyright © 2017 Tarun Sharma. All rights reserved.
//

import Foundation
class StackImplementations {
   
    //Check if given expression is balanced or not
    public static func checkBalancedParanthesis(forExpression expression:String)->Bool
    {
        var isBalanced = false
        
        let openParanthesis:[Character] = ["(","{","["]
        let closeParanthesis:[Character] = [")","}","]"]
        
        let expressionStack:StackList<Character> = StackList<Character>()
        
        //Convert the string expression to char array
        for ch:Character in expression.characters
        {
            if (openParanthesis.contains(ch))
            {
               expressionStack.push(item: ch)
            }
            else if(closeParanthesis.contains(ch))
            {
                //get the last pushed value on stack
                do{
                    let lastPushedParanthesis = try expressionStack.peek()
                    //If closing paranthesis mathing last pushed paranthesis then pop the stack
                    let matchingParanthesis = openParanthesis[closeParanthesis.index(of: ch)!]
                    if(lastPushedParanthesis == matchingParanthesis)
                    {
                        try expressionStack.pop()
                    }
                    
                }catch
                {
                    isBalanced = false
                }
            }
        }
        
        isBalanced = expressionStack.isEmpty()
        
        return isBalanced
    }
    
}
