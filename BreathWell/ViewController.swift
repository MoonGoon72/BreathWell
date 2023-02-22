//
//  ViewController.swift
//  BreathWell
//
//  Created by 문영균 on 2023/02/20.
//

import UIKit

class ViewController: UIViewController {
    
    // 기록 표시 레이블
    @IBOutlet weak var timeTableView: UITableView!
    
    // 타임 표시 레이블
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabe: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var milliSecondLabel: UILabel!
    
    // 조작 버튼
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    // 기록을 보존하는 리스트
    var recordList: [String] = ["first item", "second item", "third item"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timeTableView.delegate = self
        self.timeTableView.dataSource = self
        self.timeTableView.backgroundColor = .green
        self.timeTableView.separatorStyle = .none
    }
    
    @IBAction func didTappedStartButton(_ sender: UIButton) {
        // TODO: 시작 / 기록기능 추가
    }
    
    @IBAction func didTappedResetButton(_ sender: UIButton) {
        // TODO: 한 번 누르면 테이블 삭제 / 테이블 삭제 상태에서 한 번 더 누르면 스톱워치 중지
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.recordList[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.backgroundColor = .clear
        return UITableViewCell()
    }
}
