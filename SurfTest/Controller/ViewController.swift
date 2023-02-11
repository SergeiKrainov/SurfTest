//
//  ViewController.swift
//  SurfTest
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {

    // ScrollView

    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bounces = false
        view.showsVerticalScrollIndicator = false
        return view
    }()

    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // ImageView

    private let mainImageView: UIView = {
        let view = UIView()
        let screenSize = UIScreen.main.bounds
        let heigh = screenSize.height
        view.heightAnchor.constraint(equalToConstant: heigh / 1.6).isActive = true
        view.backgroundColor = .clear
        return view
    }()

    private let roundedView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        return view
    }()

    // Content

    private let mainContentView: UIView = {
        let view = UIView()
        let screenSize = UIScreen.main.bounds
        let heigh = screenSize.height
        view.heightAnchor.constraint(equalToConstant: heigh * 0.87).isActive = true
        view.backgroundColor = UIColor.white
        return view
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Стажировка в Surf"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 213).isActive = true
        label.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return label
    }()

    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты. "
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.6537410617, green: 0.6508514285, blue: 0.6713270545, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 213).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()

    private var collectionView1: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 12
        viewLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    private let label3: UILabel = {
        let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.6537410617, green: 0.6508514285, blue: 0.6713270545, alpha: 1)
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 213).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
    }()

    private var collectionView2: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 12
        viewLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    // Question and Button View

    private let questionAndButtonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()

    private let subViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.6537410617, green: 0.6508514285, blue: 0.6713270545, alpha: 1)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        return label
    }()

    private let applicationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1)
        button.setTitle("Отправить заявку", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        return button
    }()

    let dataText = ["IOS", "Android", "Design", "QA", "Flutter", "PM", "IOS", "Android", "Design", "QA"]

    let dataText2 = ["IOS", "QA", "Android",  "Flutter", "Design", "PM"]

    var cellArray1 = [CellModel]()
    var cellArray2 = [CellModel]()

    //MARK: - Life circle

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView1.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView2.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        applicationButton.addTarget(self, action: #selector(applicationButtonTapped), for: .touchUpInside)

        setBackgroundImage()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupScrollView()
    }

    //MARK: - Action

    @objc func applicationButtonTapped() {
        showAlert(message: "Ваша заявка успешно отправлена!", title: "Поздравляем!")
    }

    //MARK: - Setup Data

    private func setFirstCollection() {
        for i in dataText {
            let item = CellModel()
            item.title = i
            item.tapped = false
            cellArray1.append(item)
        }
    }

    private func setSecondCollection() {
        for i in dataText2 {
            let item = CellModel()
            item.title = i
            item.tapped = false
            cellArray2.append(item)
        }
    }

    //MARK: - Setup UI

    func setBackgroundImage(){
        let background = UIImage(named: "image")

        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
       }

    private func setupScrollView() {
        let margins = view.layoutMarginsGuide
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true

        configureContainerView()
        //setupImageView()
        setupContentView()
        setupRoundView()

        setFirstCollection()
        setSecondCollection()
    }

    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(mainImageView)
        scrollStackViewContainer.addArrangedSubview(mainContentView)
    }

    //MARK: - Constraints

    private func setupImageView() {
        let image = UIImage(named: "image")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: mainImageView.topAnchor, constant: -50),
            imageView.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor)
        ])
    }

    private func setupRoundView() {
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.addSubview(roundedView)

        NSLayoutConstraint.activate([
            roundedView.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor),
            roundedView.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20)
        ])
    }

    private func setupContentView() {
        mainContentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: mainContentView.topAnchor, constant: 0)
        ])

        mainContentView.addSubview(label2)
        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            label2.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -10),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5)
        ])

        mainContentView.addSubview(collectionView1)
        NSLayoutConstraint.activate([
            collectionView1.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 3),
            collectionView1.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            collectionView1.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor),
            collectionView1.heightAnchor.constraint(equalToConstant: 50)
        ])

        mainContentView.addSubview(label3)
        NSLayoutConstraint.activate([
            label3.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor, constant: 20),
            label3.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -10),
            label3.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 18)
        ])

        mainContentView.addSubview(collectionView2)
        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 25),
            collectionView2.leadingAnchor.constraint(equalTo: mainContentView.leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: mainContentView.trailingAnchor, constant: -30),
            collectionView2.heightAnchor.constraint(equalToConstant: 100)
        ])

        view.addSubview(questionAndButtonView)
        view.bringSubviewToFront(questionAndButtonView)
        let screenSize = UIScreen.main.bounds
        let heigh = screenSize.height
        let viewHeight = heigh / 8
        questionAndButtonView.frame = CGRect(x: 0, y: view.bounds.height - viewHeight, width: view.bounds.width, height: viewHeight)

        questionAndButtonView.addSubview(subViewLabel)
        NSLayoutConstraint.activate([
            subViewLabel.leadingAnchor.constraint(equalTo: questionAndButtonView.leadingAnchor, constant: 20),
            subViewLabel.topAnchor.constraint(equalTo: questionAndButtonView.topAnchor, constant: 15),
            subViewLabel.widthAnchor.constraint(equalToConstant: 120)
        ])

        questionAndButtonView.addSubview(applicationButton)
        NSLayoutConstraint.activate([
            applicationButton.leadingAnchor.constraint(equalTo: subViewLabel.trailingAnchor, constant: 24),
            applicationButton.trailingAnchor.constraint(equalTo: questionAndButtonView.trailingAnchor, constant: -20),
            applicationButton.heightAnchor.constraint(equalToConstant: 60),
            applicationButton.widthAnchor.constraint(equalToConstant: 200),
            applicationButton.topAnchor.constraint(lessThanOrEqualTo: questionAndButtonView.topAnchor, constant: 15)
        ])
    }
}

    //MARK: - CollectionView

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionView1 {
            let model1 = cellArray1[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
            cell.layer.cornerRadius = 12
            cell.setupTitles(model: model1)
            cell.button.isUserInteractionEnabled = false
            return cell
        } else {
            let model2 = cellArray2[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
            cell.backgroundColor = #colorLiteral(red: 0.9625495076, green: 0.9627466798, blue: 0.9688358903, alpha: 1)
            cell.layer.cornerRadius = 12
            cell.button.isUserInteractionEnabled = false
            cell.setupTitles(model: model2)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionView1 {
            return cellArray1.count
        } else {
            return cellArray2.count
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionView1 {
            let label = UILabel(frame: CGRect.zero)
            label.text = cellArray1[indexPath.row].title
            label.sizeToFit()
            return CGSize(width: label.frame.width + 40, height: 44)
        } else {
            let label = UILabel(frame: CGRect.zero)
            label.text = cellArray2[indexPath.row].title
            label.sizeToFit()
            return CGSize(width: label.frame.width + 40, height: 44)
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == collectionView1 {
            return 1
        } else {
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == collectionView1 {
            let item = cellArray1[indexPath.row]
            item.tapped = !item.tapped

            if item.tapped {
                cellArray1.remove(at: indexPath.row)
                cellArray1.insert(item, at: 0)
                let index = IndexPath(item: 0, section: 0)
                collectionView1.scrollToItem(at: index, at: .left, animated: true)
                collectionView1.reloadData()
            }
            collectionView1.reloadData()
        } else if collectionView == collectionView2 {
            let item = cellArray2[indexPath.row]
            item.tapped = !item.tapped

            collectionView2.reloadData()
        }
    }
}



