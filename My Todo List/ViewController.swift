//
//  ViewController.swift
//  My Todo List
//
//  Created by t2023-m0046 on 2023/08/01.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    
//    var scrollView: UIScrollView!
//    var imageView: UIImageView!
    

//    @IBAction func toDoButton(_ sender: Any) {
//        let toDoController = UIViewController()
//        toDoController.title = "할일 확인하기"
//        toDoController.view.backgroundColor = .white
//        navigationController?.pushViewController(toDoController, animated: true)
//    }
//
//    @IBAction func completedButton(_ sender: Any) {
//        let completeController = UIViewController()
//        completeController.title = "완료한일 보기"
//        completeController.view.backgroundColor = .white
//        navigationController?.pushViewController(completeController, animated: true)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scrollView = UIScrollView(frame: CGRect(x: 76, y: 214, width: 400, height: 200))
//        scrollView.delegate = self
//        scrollView.backgroundColor = .clear
//
//        imageView = UIImageView(frame: CGRect(origin: .zero , size: CGSize(width: 240, height: 128)))
//        let image = UIImage(named: "하기 싫어 짤")
//        imageView.image = image
//        imageView.contentMode = .scaleAspectFill
//
//        scrollView.addSubview(imageView)
//
//        scrollView.contentSize = CGSize(width: view.bounds.width * 2, height: 300 * 2)
//        scrollView.minimumZoomScale = 0.5
//        scrollView.maximumZoomScale = 2.0
//
//        view.addSubview(scrollView)
//
//        //        let imageView = UIImageView(frame: CGRect(x: 76, y: 214, width: 240, height: 128))
//        //        let image = UIImage(named: "하기 싫어 짤")
//        //        imageView.image = image
//        //        imageView.contentMode = .scaleAspectFit
//        //        self.view.addSubview(imageView)
//        //    }
//
//        }
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        return imageView
//    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.zoomScale <= 1.0 {
//        scrollView.zoomScale = 1.0
//        }
//
//        if scrollView.zoomScale >= 2.0 {
//        scrollView.zoomScale = 2.0
//        }
    }
}



//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        Button1.titleLabel?.textColor = .blue
//        Button1.setTitle("할일 확인하기", for: .normal)
//        Button1.addTarget(self, action: #selector(pushViewController), for: .touchUpInside)
//    }
//    @objc func pushViewController() {
//        let newViewController = UIViewController()
//        newViewController.title = "할일 확인하기"
//        newViewController.view.backgroundColor = .white
//        navigationController?.pushViewController(newViewController, animated: true)
//    }

//}

