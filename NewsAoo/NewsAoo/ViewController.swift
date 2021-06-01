//
//  ViewController.swift
//  NewsAoo
//
//  Created by Tushar Vijayvargiya on 27/05/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController {
    var viewModel = NewsListViewModel()
    
    private lazy var headerView:HeaderView = {
        let v = HeaderView(fontsize: 32)
        return v
    }()
    
    private lazy var tableView:UITableView = {
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.tableFooterView = UIView()
        v.register(NewsTableViewCell.self, forCellReuseIdentifier: viewModel.reuseID)
        v.delegate = self
        v.dataSource = self
        return v
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        
        setupView()
        fetchNews()
        }
    
    func setupView()
    {
        view.backgroundColor = .white
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        
        setupConstraints()
    }
    func setupConstraints()
    {
        NSLayoutConstraint.activate([headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                                     headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
                                    ])
        
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 8),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                                    ])
    }
    func fetchNews()
    {
        viewModel.getNews { _ in
            self.tableView.reloadData()
        }
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsVM.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.reuseID, for: indexPath) as? NewsTableViewCell
        let news = viewModel.newsVM[indexPath.row]
        cell?.newsVM = news
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let news = viewModel.newsVM[indexPath.row]
        guard let url = URL(string: news.url) else {
            return
        }
        let config = SFSafariViewController.Configuration()
        let safariviewController = SFSafariViewController(url: url, configuration: config)
        safariviewController.modalPresentationStyle = .fullScreen
        present(safariviewController, animated: true)
    }
}
        



