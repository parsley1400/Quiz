//
//  QuizViewController.swift
//  Quiz
//
//  Created by risako takeya on 2020/09/19.
//  Copyright © 2020 com.litech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        quizArray.append(["キャプテンアメリカの出身地は","カリフォルニア","ブルックリン","ニューオーリンズ",2])
        quizArray.append(["キャプテンアメリカの本名は","スティーブ・ロジャース","トニー・スターク","ブルース・バナー",1])
        quizArray.append(["キャプテンアメリカの盾は何でできている？","鋼鉄","サンガニウム","ヴィブラニウム",3])
        quizArray.append(["キャプテンアメリカの一作目のタイトルは？","ファースト・ウォー","ファースト・ゲーム","ファースト・アベンジャー",3])
        quizArray.append(["キャプテンアメリカの決め台詞は？","Avengers Fight!","Avengers Assemble!","Avengers Go!",2])
        quizArray.append(["キャプテンアメリカが活躍したのは","第一次世界大戦","第二次世界大戦","第三次世界大戦",2])
        
        quizArray.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz(){
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton){
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0{
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
