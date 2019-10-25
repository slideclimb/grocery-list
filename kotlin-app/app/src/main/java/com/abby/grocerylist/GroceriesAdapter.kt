package com.abby.grocerylist

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView

/**
 * List adapter for a list of groceries.
 */
class GroceriesAdapter(private val groceries: List<Grocery>) : RecyclerView.Adapter<GroceryViewHolder>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): GroceryViewHolder {
        val inflater = LayoutInflater.from(parent.context)
        return GroceryViewHolder(inflater, parent)
    }

    override fun getItemCount(): Int = groceries.size

    // Bind a Grocery to the view for a Grocery item.
    override fun onBindViewHolder(holder: GroceryViewHolder, position: Int) {
        holder.bind(groceries[position])
    }
}