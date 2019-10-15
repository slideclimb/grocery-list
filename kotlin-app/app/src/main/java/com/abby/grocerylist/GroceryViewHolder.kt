package com.abby.grocerylist

import android.view.LayoutInflater
import android.view.ViewGroup
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
        grocery_done.isChecked = grocery.done
        grocery_done.text = grocery.item
        // Set listener on the checkbox to update the value in firebase.
        grocery_done.setOnCheckedChangeListener { _, newDone -> grocery.update(newDone) }
    }
}