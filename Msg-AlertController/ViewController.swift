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
    
    // 로그인 버튼
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let msg = "사용자의 Apple ID youn2029@naver.com의 암호를 입력하십시오"
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){
            (_) in
            // 확인 버튼을 클릭했을 때 처리할 내용
            if let tf = alert.textFields?.first {
                //self.result.text = "입력된 값은 \(tf.text!)입니다."
                print("입력된 값은 \(tf.text!)입니다.")
            }else {
                print("입력된 값이 없습니다.")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 텍스트 필드 추가
        alert.addTextField(configurationHandler: {(tf) in
            // 텍스트필드의 속성설정
            tf.placeholder = "암호"   // 안내 메시지
            tf.isSecureTextEntry = true // 비밀번호 처리
        })
        
        self.present(alert, animated: false)
        
    }
    
    // 사용자 인증 버튼
    @IBAction func auth(_ sender: Any) {
        let msg = "로그인"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default){
            (_) in
            
            // 확인 버튼을 클릭했을때 처리할 내용
            let loginId = alert.textFields?[0].text
            let loginPw = alert.textFields?[1].text
            
            if loginId == "youn2029" && loginPw == "1234" {
                self.result.text = "인증되었습니다"
            }else {
                self.result.text = "인증에 실패하였습니다."
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 아이디 - 텍스트필드
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "아이디"
        })
        
        // 비밀번호 - 텍스트필드
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "비밀벉호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 화면이 표시됨과 동시에 메시지 창을 띄울라면
        // viewDidLoad()가 아니라 viewDidAppear() 에서 구현
        // why? viewDidLoad()는 화면이 표시되기 전에 호출됨
        //      viewDidAppeard()는 화면이 표시가 되고 난후에 호출됨
        let firstAlert = UIAlertController(title: "알림창", message: "바로 메시지창을 띄움", preferredStyle: .alert)
        
        let cancel1 = UIAlertAction(title: "취소", style: .cancel, handler: {(_) in self.result.text = "바로 띄운 알림창 확인!"})
        
        firstAlert.addAction(cancel1)
        
        self.present(firstAlert, animated: false)
    }

}

