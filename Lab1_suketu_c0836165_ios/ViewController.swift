//
//  ViewController.swift
//  Lab1_suketu_c0836165_ios
//
//  Created by suketu on 1/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum PlayerTurn
    {
        case zero
        case cross
    }

    
    @IBOutlet weak var turnlabel: UILabel!
    
   
    
    @IBOutlet weak var c3: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a1: UIButton!
    
    var FirstTurn = PlayerTurn.cross
    var currentTurn = PlayerTurn.cross
    var zero = "0"
    var cross = " X"
    var ClearBoard = [UIButton]()
    
    
    var zeroscore = 0
    var crossscore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initBoard()
        
        
    }
    
    // inorder to initialize and add into the board
    func initBoard(){
        ClearBoard.append(a1)
        ClearBoard.append(a2)
        ClearBoard.append(a3)
        ClearBoard.append(b1)
        ClearBoard.append(b2)
        ClearBoard.append(b3)
        ClearBoard.append(c1)
        ClearBoard.append(c2)
        ClearBoard.append(c3)
    }
    
    
    // function to reset the board
    func resetTheBoard()
    {
        for button in ClearBoard
                
        {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
            }
        if (FirstTurn == PlayerTurn.cross)
        {
            FirstTurn = PlayerTurn.zero
            turnlabel.text = zero
            
        }
        else if(FirstTurn == PlayerTurn.zero)
        {
            FirstTurn = PlayerTurn.cross
            turnlabel.text = cross
        }
        currentTurn = FirstTurn
    }
    
    
    
    
    
    @IBAction func tapaction(_ sender: UIButton)
    {
        actionOnBoard(sender)
        
        if checkForWinner(cross)
        {
            crossscore += 1
            resultAlert(title: " cross team win the round!!")
        }
        if checkForWinner(zero){
            zeroscore += 1
            resultAlert(title: "zero team win the round !!")
        }
        
        if(fullBoard())
        {
            resultAlert(title: " match draw")
        }
    }
    
    
    // to show the alert box at the end
    func resultAlert(title: String)
        {
            let message = "       TEAM CROSS'S WIN POINT   " + String(crossscore) + "                                             TEAM ZERO'S WIN POINT " + String(zeroscore)
            
            let msgalert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            msgalert.addAction(UIAlertAction(title: " Reset Board ", style: .default, handler: { (_) in self.resetTheBoard()}))
            
            self.present(msgalert, animated: true)
            
        }
    func fullBoard() -> Bool
    {
        for button in ClearBoard
        {
            if button.title(for: .normal) == nil
            {
            return false
            }
        }
        return true
    }
    
    
    // to check the winner of the game
    func checkForWinner(_ s: String)-> Bool
    {
        // to check horizontally who is winner
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s)
        {
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s)
        {
            return true
        }
        // to chech vertically who is winner
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s)
        {
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s)
        {
            return true
        }
        
        // to check diagonally who is winner
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s)
        {
            return true
        }
        return false
    }
    
    func thisSymbol(_ button : UIButton , _ symbol : String ) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    // to perform the action on the board
   
    func actionOnBoard(_ sender : UIButton){
        if (sender.title(for: .normal) == nil)
        {
            if(currentTurn == PlayerTurn.zero)
            {
                sender.setTitle(zero, for: .normal)
                currentTurn = PlayerTurn.cross
                turnlabel.text = cross
            }
            else if(currentTurn == PlayerTurn.cross)
            {
                sender.setTitle(cross, for: .normal)
                currentTurn = PlayerTurn.zero
                turnlabel.text = zero
            }
            
            sender.isEnabled = false ;
        }
    }
    
   


}

