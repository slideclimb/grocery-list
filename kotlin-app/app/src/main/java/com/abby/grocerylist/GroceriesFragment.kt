package com.abby.grocerylist

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.groceries_fragment.*

/**
 * Fragment that contains the list that shows the groceries, and shows a form to add a new grocery
 * to the list.
 */
class GroceriesFragment : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? =
        inflater.inflate(R.layout.groceries_fragment, container, false)

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        // Add a listener to the query.
        FirebaseHelper().collection.addSnapshotListener { snapshot, _ ->
            // Put the returned groceries in a list.
            val groceries = snapshot?.map {
                Grocery(
                    it.id,
                    it.data["done"].toString().toBoolean(),
                    it.data["item"].toString()
                )
            } ?: listOf()

            // Display the groceries in two lists. The first list contains the to do items, and the
            // second list contains the done items.
            groceries_list.apply {
                layoutManager = LinearLayoutManager(activity)
                adapter = GroceriesAdapter(groceries.filter { !it.done })
            }

            // Hide the 'done' header when there are no done groceries.
            done_header.visibility = if (groceries.none { it.done }) View.INVISIBLE else View.VISIBLE

            groceries_list_done.apply {
                layoutManager = LinearLayoutManager(activity)
                adapter = GroceriesAdapter(groceries.filter { it.done })
            }

            // Delete all the done items when clicking that button.
            delete_done_button.setOnClickListener {
                groceries.filter { it.done }.forEach { it.delete() }
            }
        }

    }
}