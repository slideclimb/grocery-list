package com.abby.grocerylist

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.inputmethod.EditorInfo
import android.widget.Toast
import com.google.firebase.firestore.FirebaseFirestore
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        add_item.on(EditorInfo.IME_ACTION_DONE) {
            Grocery(item = add_item.text.toString()).store()
            add_item.text.clear()
        }

        supportFragmentManager.replace(R.id.fragment_container, GroceriesFragment())
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.delete_all -> {
                // Get all groceries and delete them one by one.
                val db = FirebaseFirestore.getInstance()
                val groceriesCollection = db.collection("groceries")
                groceriesCollection.get().addOnSuccessListener { snapshot ->
                    // Put the returned groceries in a list.
                    val groceries = snapshot?.map {
                        Grocery(
                            it.id,
                            it.data["done"].toString().toBoolean(),
                            it.data["item"].toString()
                        )
                    } ?: listOf()
                    groceries.forEach { it.delete() }
                }
                Toast.makeText(this, "deleting", Toast.LENGTH_SHORT).show()
                true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }
}
