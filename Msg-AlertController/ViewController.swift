//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by 윤성호 on 21/01/2019.
//  Copyright © 2019 윤성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var result: UILabel!  // 알림창 결과를 표시
    
    // 알림창 실행 버튼
    @IBAction func alert(_ sender: Any) {
        
        // 컨트롤러 초기화
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요", preferredStyle: .alert)
        
        // 취소버튼
        let cancel = UIAlertAction(title: "취소", style: .cancel){
            (_) in
            self.result.text = "취소 버튼을 클릭했습니다."
        }
        
        // 확인버튼
        let ok = UIAlertAction(title: "확인", style: .default){
            (_) in self.result.text = "확인 버튼을 클릭했습니다."
        }
        
        // 실행버튼
        let exec = UIAlertAction(title: "실행", style: .destructive){
            (_) in self.result.text = "실행 버튼을 클릭했습니다."
        }
        
        // 중지버튼
        let stop = UIAlertAction(title: "중지", style: .default){
            (_) in self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        // 버튼을 컨트롤러에 등록
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 알림창 실행
        self.present(alert, animated: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}

