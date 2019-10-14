package com.abby.grocerylist

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.inputmethod.EditorInfo
import android.widget.Toast
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
}
