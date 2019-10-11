package com.abby.grocerylist

import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.CheckBox
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.grocery_list_item.view.*

/**
 * View holder for a Grocery item view.
 */
class GroceryViewHolder(inflater: LayoutInflater, parent: ViewGroup) :
    RecyclerView.ViewHolder(inflater.inflate(R.layout.grocery_list_item, parent, false)) {

    /**
     * Bind a Grocery to its view.
     */
    fun bind(grocery: Grocery) = with(itemView) {
        this.findViewById<TextView>(R.id.grocery_item).text = grocery.item
        this.findViewById<CheckBox>(R.id.grocery_done).isChecked = grocery.done
        // Set listener on the checkbox to update the value in firebase.
        grocery_done.setOnCheckedChangeListener { _, newDone -> grocery.update(newDone) }
    }
}