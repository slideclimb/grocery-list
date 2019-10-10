package com.abby.grocerylist

import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

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
    }
}