//
//  ViewController.swift
//  SurfTest
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {

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

    let dataText = ["IOS", "Android", "Design", "QA", "Flutter", "PM", "IOS", "Android", "Design", "QA", "Flutter", "PM"]

    let dataText2 = ["IOS", "QA", "Android",  "Flutter", "Design", "PM"]

    var cellArray1 = [CellModel]()
    var cellArray2 = [CellModel]()


    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let scrollStackViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageViewMain: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 521).isActive = true
        view.backgroundColor = UIColor.cyan
        return view
    }()

    private let subview2: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 420).isActive = true
        view.backgroundColor = UIColor.white
        return view
    }()

    private let subview3: UIView = {
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

    private let subViewButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = #colorLiteral(red: 0.2511924207, green: 0.2511924207, blue: 0.2511924207, alpha: 1)
        button.setTitle("Отправить заявку", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 30
        return button
    }()

    private let radiousView: UIView = {
        let view = UIView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
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

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView1.delegate = self
        collectionView1.dataSource = self
        collectionView1.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        collectionView2.delegate = self
        collectionView2.dataSource = self
        collectionView2.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        scrollView.showsVerticalScrollIndicator = false
        scrollView.bounces = false
        setupScrollView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        setupImageView()
        setupContentView()
        setupRoundView()

        setFirstCollection()
        setSecondCollection()
    }

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

    private func configureContainerView() {
        scrollStackViewContainer.addArrangedSubview(imageViewMain)
        scrollStackViewContainer.addArrangedSubview(subview2)
    }

    private func setupImageView() {
        let image = UIImage(named: "image")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewMain.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: imageViewMain.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageViewMain.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: imageViewMain.topAnchor, constant: -50),
            imageView.bottomAnchor.constraint(equalTo: imageViewMain.bottomAnchor)
        ])
    }

    private func setupRoundView() {
        radiousView.translatesAutoresizingMaskIntoConstraints = false
        imageViewMain.addSubview(radiousView)

        NSLayoutConstraint.activate([
            radiousView.leadingAnchor.constraint(equalTo: imageViewMain.leadingAnchor),
            radiousView.trailingAnchor.constraint(equalTo: imageViewMain.trailingAnchor),
            radiousView.bottomAnchor.constraint(equalTo: imageViewMain.bottomAnchor, constant: 20)
        ])
    }

    private func setupContentView() {
        subview2.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: subview2.leadingAnchor, constant: 20),
            label.topAnchor.constraint(equalTo: subview2.topAnchor, constant: 0)
        ])

        subview2.addSubview(label2)

        NSLayoutConstraint.activate([
            label2.leadingAnchor.constraint(equalTo: subview2.leadingAnchor, constant: 20),
            label2.trailingAnchor.constraint(equalTo: subview2.trailingAnchor, constant: -10),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5)
        ])

        subview2.addSubview(collectionView1)

        NSLayoutConstraint.activate([
            collectionView1.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 5),
            collectionView1.leadingAnchor.constraint(equalTo: subview2.leadingAnchor),
            collectionView1.trailingAnchor.constraint(equalTo: subview2.trailingAnchor),
            collectionView1.heightAnchor.constraint(equalToConstant: 50)
        ])

        subview2.addSubview(label3)

        NSLayoutConstraint.activate([
            label3.leadingAnchor.constraint(equalTo: subview2.leadingAnchor, constant: 20),
            label3.trailingAnchor.constraint(equalTo: subview2.trailingAnchor, constant: -10),
            label3.topAnchor.constraint(equalTo: collectionView1.bottomAnchor, constant: 15)
        ])

        subview2.addSubview(collectionView2)

        NSLayoutConstraint.activate([
            collectionView2.topAnchor.constraint(equalTo: label3.bottomAnchor, constant: 25),
            collectionView2.leadingAnchor.constraint(equalTo: subview2.leadingAnchor),
            collectionView2.trailingAnchor.constraint(equalTo: subview2.trailingAnchor, constant: -30),
            collectionView2.heightAnchor.constraint(equalToConstant: 100)
        ])

        view.addSubview(subview3)
        view.bringSubviewToFront(subview3)
        subview3.frame = CGRect(x: 0, y: view.bounds.height - 120, width: view.bounds.width, height: 120)
//        NSLayoutConstraint.activate([
//            subview3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            subview3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            subview3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
//        ])
        subview3.addSubview(subViewLabel)
        NSLayoutConstraint.activate([
            subViewLabel.leadingAnchor.constraint(equalTo: subview3.leadingAnchor, constant: 20),
            subViewLabel.topAnchor.constraint(equalTo: subview3.topAnchor, constant: 20),
            subViewLabel.widthAnchor.constraint(equalToConstant: 120)
        ])

        subview3.addSubview(subViewButton)
        NSLayoutConstraint.activate([
            subViewButton.leadingAnchor.constraint(equalTo: subViewLabel.trailingAnchor, constant: 24),
            subViewButton.trailingAnchor.constraint(equalTo: subview3.trailingAnchor, constant: -20),
            subViewButton.heightAnchor.constraint(equalToConstant: 60),
            subViewButton.widthAnchor.constraint(equalToConstant: 200),
            subViewButton.topAnchor.constraint(equalTo: subview3.topAnchor, constant: 20)
        ])
    }
}

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
            label.text = dataText[indexPath.item]
            label.sizeToFit()
            return CGSize(width: label.frame.width + 40, height: 44)
        } else {
            let label = UILabel(frame: CGRect.zero)
            label.text = dataText2[indexPath.item]
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



