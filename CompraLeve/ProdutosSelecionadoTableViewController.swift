//
//  ProdutosSelecionadoTableViewController.swift
//  CompraLeve
//
//  Created by Student on 5/9/17.
//  Copyright © 2017 Wolves. All rights reserved.
//

import UIKit

class ProdutosSelecionadoTableViewController: UITableViewController {
    
    
    var itens = [Item]()

    @IBOutlet weak var precoTotalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itens = ListaProdutosTableViewController.itens
        precoTotalLabel.text = "Total: R$ "+calculaTotal()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.itens.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        let item: Item
        item = itens[indexPath.row]
        
        if let itemCell = cell as? ProdutosSelecionadosTableViewCell {
            itemCell.nomeProdutoLabel.text = item.produto.nome
            itemCell.quantidadeLabel.text = String(item.quantidade)
            itemCell.precoTotalLabel.text = "R$ "+String(Double(item.quantidade)*item.produto.preco)
            itemCell.precoLabel.text = "R$ "+String(item.produto.preco)
        }
        
        
        return cell
    }
    
    func calculaTotal() -> String{
        var total = 0.0
        for item in ListaProdutosTableViewController.itens {
            total+=Double(item.quantidade)*item.produto.preco
        }
        return String(total)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
