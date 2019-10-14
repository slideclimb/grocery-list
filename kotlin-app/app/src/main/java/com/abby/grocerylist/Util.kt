package com.abby.grocerylist

import android.widget.EditText
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager


/**
 * Set a new fragment on the layout, i.e., replace the current fragment.
 */
fun FragmentManager.replace(layout: Int, fragment: Fragment) {
    // Start a fragment transaction.
    val transaction = beginTransaction()

    // Replace the fragment currently in the container specified by layout.
    transaction.replace(layout, fragment)
    transaction.addToBackStack(null)

    // Finish the transaction.
    transaction.commit()
}


fun EditText.on(actionId: Int, func: () -> Unit) {
    setOnEditorActionListener { textView, receivedActionId, keyEvent ->
        if (actionId == receivedActionId) func()
        true
    }
}